
const formularioBusca = document.getElementById("form-busca");
const campoBusca = document.getElementById("campo-busca");
const cursos = document.querySelectorAll(".card-curso");
const mensagemBusca = document.getElementById("mensagem-busca");

formularioBusca.addEventListener("submit", function (evento) {
    evento.preventDefault();

    const termo = campoBusca.value.trim().toLowerCase();
    let encontrados = 0;

    cursos.forEach(function (curso) {
        const nome = curso.dataset.nome.toLowerCase();
        const categoria = curso.dataset.categoria.toLowerCase();
        const descricao = curso.querySelector("p").textContent.toLowerCase();

        const corresponde =
            nome.includes(termo) ||
            categoria.includes(termo) ||
            descricao.includes(termo);

        curso.style.display = corresponde ? "block" : "none";

        if (corresponde) {
            encontrados++;
        }
    });

    if (termo === "") {
        mensagemBusca.textContent = "Digite o nome de um curso para pesquisar.";
    } else if (encontrados === 0) {
        mensagemBusca.textContent = "Nenhum curso encontrado. Tente outro termo.";
    } else {
        mensagemBusca.textContent =
            encontrados === 1
                ? "Foi encontrado 1 curso."
                : `Foram encontrados ${encontrados} cursos.`;
    }
});

document.querySelectorAll(".card-categoria").forEach(function (categoria) {
    categoria.addEventListener("click", function () {
        const nomeCategoria = categoria.dataset.categoria.toLowerCase();

        cursos.forEach(function (curso) {
            const corresponde =
                curso.dataset.categoria.toLowerCase() === nomeCategoria;

            curso.style.display = corresponde ? "block" : "none";
        });

        mensagemBusca.textContent =
            "Categoria selecionada: " + categoria.querySelector("h3").textContent;

        document.getElementById("lista-cursos").scrollIntoView({
            behavior: "smooth"
        });
    });
});
