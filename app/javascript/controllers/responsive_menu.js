window.addEventListener('load', () => {
    var responsive_menu_open = document.getElementById('responsive_menu_open');
    var responsive_menu_close = document.getElementById('responsive_menu_close');
    var responsive_menu = document.getElementById('responsive_menu');

    responsive_menu_open.addEventListener('click', () => {
        responsive_menu.style.display = 'flex';
        responsive_menu_open.style.display = 'none';
        responsive_menu_close.style.display = 'inline-block';
    });

    responsive_menu_close.addEventListener('click', () => {
        responsive_menu.style.display = 'none';
        responsive_menu_close.style.display = 'none';
        responsive_menu_open.style.display = 'inline-block';
    });

    //初期表示は非表示
    var edit_delete = document.getElementById("edit_delete");
    edit_delete.style.display = 'none'
});