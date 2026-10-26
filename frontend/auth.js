const API = 'http://localhost:8080';
const CHAVE = 'techlearn_usuario';

function usuarioLogado() {
  try { return JSON.parse(localStorage.getItem(CHAVE)); } catch (e) { return null; }
}
function salvarUsuario(u) { localStorage.setItem(CHAVE, JSON.stringify(u)); }
function sair() { localStorage.removeItem(CHAVE); location.href = 'index.html'; }

function destinoSeguro(v) {
  return v && /^[\w.\-]+\.html(\?[\w=&%.\-]*)?(#[\w\-]*)?$/.test(v) ? v : 'index.html';
}

function irParaLogin(destino) {
  location.href = 'login.html?voltar=' + encodeURIComponent(destinoSeguro(destino));
}

function exigirLogin() {
  if (!usuarioLogado()) irParaLogin(location.pathname.split('/').pop() + location.search);
}

document.addEventListener('click', function (e) {
  const el = e.target.closest('[data-protegido]');
  if (!el || usuarioLogado()) return;
  e.preventDefault();
  irParaLogin(el.getAttribute('href') || el.dataset.destino);
});


function atualizarBarra() {
  const u = usuarioLogado();
  const entrar = document.getElementById('btn-entrar');
  const criar = document.getElementById('btn-criar-conta');
  if (!u || !entrar || !criar) return;
  entrar.textContent = 'Olá, ' + u.nome.split(' ')[0];
  entrar.removeAttribute('href');
  criar.textContent = 'Sair';
  criar.removeAttribute('href');
  criar.style.cursor = 'pointer';
  criar.addEventListener('click', sair);
}
document.addEventListener('DOMContentLoaded', atualizarBarra);

async function postJson(caminho, corpo) {
  const r = await fetch(API + caminho, {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify(corpo)
  });
  let dados = null;
  try { dados = await r.json(); } catch (e) { }
  return { ok: r.ok, status: r.status, dados: dados };
}
