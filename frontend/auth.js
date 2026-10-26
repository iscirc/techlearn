// TechLearn - Configuração Centralizada da API e Autenticação
const CHAVE_STORAGE_API = 'techlearn_api_url';
const CHAVE = 'techlearn_usuario';

// URL de produção / túnel HTTPS padrão para o GitHub Pages
// Você pode alterar pelo console chamando definirApiUrl('https://...') ou clicando no aviso de conexão
const URL_PRODUCAO_PADRAO = 'https://born-cleveland-black-exercises.trycloudflare.com';

function obterApiUrl() {
  const salva = localStorage.getItem(CHAVE_STORAGE_API);
  if (salva && salva.trim()) {
    return salva.trim().replace(/\/+$/, '');
  }
  const host = window.location.hostname;
  const isLocal = host === 'localhost' || host === '127.0.0.1' || host === '';
  if (isLocal) {
    return 'http://localhost:8080';
  }
  return URL_PRODUCAO_PADRAO;
}

window.API = obterApiUrl();
var API = window.API;

function definirApiUrl(novaUrl) {
  if (!novaUrl || !novaUrl.trim()) {
    localStorage.removeItem(CHAVE_STORAGE_API);
    alert('URL da API restaurada para o padrão: ' + URL_PRODUCAO_PADRAO);
  } else {
    const limpa = novaUrl.trim().replace(/\/+$/, '');
    localStorage.setItem(CHAVE_STORAGE_API, limpa);
    alert('Nova URL da API configurada com sucesso: ' + limpa);
  }
  window.location.reload();
}
window.definirApiUrl = definirApiUrl;

function promptConfigurarApi() {
  const atual = obterApiUrl();
  const nova = window.prompt(
    'Configurar URL da API TechLearn:\n(Deixe vazio para restaurar o padrão)',
    atual
  );
  if (nova !== null) {
    definirApiUrl(nova);
  }
}
window.promptConfigurarApi = promptConfigurarApi;

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
