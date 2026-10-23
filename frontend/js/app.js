console.log('TechLearn carregado');

const API = 'http://localhost:8080';

const formBusca = document.getElementById('form-busca');
const campoBusca = document.getElementById('campo-busca');
const mensagem = document.getElementById('mensagem-busca');
const gradeCursos = document.querySelector('.grade-cursos');
const cardsCategoria = document.querySelectorAll('.card-categoria');

let todosCursos = [];
let categoriaAtiva = '';

function normalizar(texto) {
    return texto
        .toLowerCase()
        .normalize('NFD')
        .replace(/[\u0300-\u036f]/g, '')
        .trim();
}

function criarCard(curso) {
    const card = document.createElement('article');
    card.className = 'card-curso';

    const etiqueta = document.createElement('span');
    etiqueta.className = 'etiqueta';
    etiqueta.textContent = curso.categoria ? curso.categoria.nome : '';

    const titulo = document.createElement('h3');
    titulo.textContent = curso.titulo;

    const descricao = document.createElement('p');
    descricao.textContent = curso.descricao || '';

    const link = document.createElement('a');
    link.className = 'link-curso';
    link.href = 'curso.html?id=' + curso.id;
    link.textContent = 'Ver curso';

    card.append(etiqueta, titulo, descricao, link);
    return card;
}

function mostrarCursos() {
    const termo = normalizar(campoBusca.value);

    const filtrados = todosCursos.filter(function (curso) {
        const categoria = curso.categoria ? normalizar(curso.categoria.nome) : '';
        const combinaTexto = normalizar(curso.titulo).includes(termo);
        const combinaCategoria = categoriaAtiva === '' || categoria === categoriaAtiva;
        return curso.ativo && combinaTexto && combinaCategoria;
    });

    gradeCursos.innerHTML = '';
    filtrados.forEach(function (curso) {
        gradeCursos.appendChild(criarCard(curso));
    });

    mensagem.textContent = filtrados.length === 0 ? 'Nenhum curso encontrado.' : '';
}

async function carregarCursos() {
    try {
        const resposta = await fetch(API + '/cursos');
        if (!resposta.ok) {
            throw new Error('Erro ' + resposta.status);
        }
        todosCursos = await resposta.json();
        mostrarCursos();
    } catch (erro) {
        console.error(erro);
        mensagem.textContent = 'Não foi possível carregar os cursos. Verifique se a API está rodando.';
    }
}

formBusca.addEventListener('submit', function (evento) {
    evento.preventDefault();
    mostrarCursos();
});

cardsCategoria.forEach(function (card) {
    card.addEventListener('click', function (evento) {
        evento.preventDefault();
        const escolhida = normalizar(card.dataset.categoria);
        categoriaAtiva = categoriaAtiva === escolhida ? '' : escolhida;

        cardsCategoria.forEach(function (outro) {
            const ativa = normalizar(outro.dataset.categoria) === categoriaAtiva;
            outro.classList.toggle('ativa', ativa);
        });

        mostrarCursos();
        document.getElementById('lista-cursos').scrollIntoView({ behavior: 'smooth' });
    });
});

carregarCursos();