(function () {

    const URL_CHAT = 'http://localhost:8080/chat';

    let botao = document.getElementById('botao-chat');
    if (!botao) {
        botao = document.createElement('button');
        botao.id = 'botao-chat';
        botao.type = 'button';
        botao.className = 'botao-chat';
        botao.textContent = 'Dúvidas? Fale com a IA';
        document.body.appendChild(botao);
    }

    const painel = document.createElement('section');
    painel.className = 'chat';
    painel.hidden = true;
    painel.setAttribute('aria-label', 'Chat com o assistente TechLearn AI');

    const topo = document.createElement('div');
    topo.className = 'chat-topo';

    const titulo = document.createElement('strong');
    titulo.textContent = 'TechLearn AI';

    const fechar = document.createElement('button');
    fechar.type = 'button';
    fechar.className = 'chat-fechar';
    fechar.setAttribute('aria-label', 'Fechar chat');
    fechar.textContent = '×';

    topo.append(titulo, fechar);

    const mensagens = document.createElement('div');
    mensagens.className = 'chat-mensagens';
    mensagens.setAttribute('aria-live', 'polite');

    const form = document.createElement('form');
    form.className = 'chat-form';

    const campo = document.createElement('input');
    campo.type = 'text';
    campo.placeholder = 'Digite sua dúvida';
    campo.maxLength = 500;
    campo.autocomplete = 'off';
    campo.setAttribute('aria-label', 'Digite sua dúvida');

    const enviar = document.createElement('button');
    enviar.type = 'submit';
    enviar.textContent = 'Enviar';

    form.append(campo, enviar);
    painel.append(topo, mensagens, form);
    document.body.appendChild(painel);

    function adicionarMensagem(texto, tipo) {
        const msg = document.createElement('div');
        msg.className = 'chat-msg ' + tipo;
        msg.textContent = texto;
        mensagens.appendChild(msg);
        mensagens.scrollTop = mensagens.scrollHeight;
        return msg;
    }

    function alternarPainel(abrir) {
        painel.hidden = !abrir;
        if (abrir) {
            campo.focus();
        }
    }

    botao.addEventListener('click', function () {
        alternarPainel(painel.hidden);
    });

    fechar.addEventListener('click', function () {
        alternarPainel(false);
    });

    adicionarMensagem('Olá! Como posso ajudar?', 'bot');

    form.addEventListener('submit', async function (evento) {
        evento.preventDefault();

        const pergunta = campo.value.trim();
        if (pergunta === '') {
            return;
        }

        adicionarMensagem(pergunta, 'usuario');
        campo.value = '';
        campo.disabled = true;
        enviar.disabled = true;
        const aguardando = adicionarMensagem('Digitando...', 'bot');

        try {
            const resposta = await fetch(URL_CHAT, {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ pergunta: pergunta })
            });
            const dados = await resposta.json().catch(function () {
                return {};
            });
            aguardando.remove();

            if (resposta.ok && dados.resposta) {
                adicionarMensagem(dados.resposta, 'bot');
            } else {
                adicionarMensagem(
                    dados.erro || 'O assistente não conseguiu responder agora. Tente novamente.',
                    'erro');
            }
        } catch (erro) {
            console.error(erro);
            aguardando.remove();
            adicionarMensagem('Não foi possível conectar à API. Confira se a aplicação está rodando.', 'erro');
        } finally {
            campo.disabled = false;
            enviar.disabled = false;
            campo.focus();
        }
    });

})();