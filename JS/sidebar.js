const sidebar = document.getElementById('sidebar');
const menuToggle = document.getElementById('menuToggle');

menuToggle.onclick = () => {
   sidebar.classList.toggle('active');
};
