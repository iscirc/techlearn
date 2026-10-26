(function () {

    const API = window.API || 'http://localhost:8080';

    const parametros = new URLSearchParams(window.location.search);
    const cursoId = parametros.get('id');

    const tituloCurso = document.getElementById('titulo-curso');
    const descricaoCurso = document.getElementById('descricao-curso');
    const mensagem = document.getElementById('mensagem-curso');
    const player = document.getElementById('player');
    const tituloAula = document.getElementById('titulo-aula');
    const listaAulas = document.getElementById('lista-aulas');

    function tocarAula(aula, item) {
        player.src = 'https://www.youtube.com/embed/' + aula.videoYoutubeId + '?rel=0';
        tituloAula.textContent = aula.titulo;

        listaAulas.querySelectorAll('li').forEach(function (li) {
            li.classList.remove('ativa');
        });
        item.classList.add('ativa');
    }

    function montarLista(aulas) {
        aulas.forEach(function (aula) {
            const item = document.createElement('li');
            item.textContent = aula.titulo;
            item.addEventListener('click', function () {
                tocarAula(aula, item);
            });
            listaAulas.appendChild(item);
        });
    }

    async function carregarCurso() {
        if (!cursoId) {
            mensagem.textContent = 'Curso não informado.';
            return;
        }

        try {
            const [respostaCurso, respostaAulas] = await Promise.all([
                fetch(API + '/cursos/' + cursoId),
                fetch(API + '/aulas/curso/' + cursoId)
            ]);

            if (!respostaCurso.ok || !respostaAulas.ok) {
                throw new Error('Curso não encontrado');
            }

            const curso = await respostaCurso.json();
            const aulas = await respostaAulas.json();

            document.title = 'TechLearn - ' + curso.titulo;
            tituloCurso.textContent = curso.titulo;
            descricaoCurso.textContent = curso.descricao || '';

            if (aulas.length === 0) {
                mensagem.textContent = 'Este curso ainda não tem aulas.';
                return;
            }

            montarLista(aulas);
            tocarAula(aulas[0], listaAulas.firstElementChild);
        } catch (erro) {
            console.error(erro);
            mensagem.innerHTML = 'Não foi possível carregar o curso da API (' + API + '). ' +
                '<a href="javascript:void(0)" onclick="promptConfigurarApi()" style="color:#1F5FC8;text-decoration:underline;">Configurar URL da API</a>';
        }
    }

    carregarCurso();

})();
