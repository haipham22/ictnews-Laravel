jQuery(document).ready(function ($) {
    if ($('#list').length) {
        $('#list').dataTable({
            /** Option cho list */
        });
    }
    $('a.delete').click(function (e) {

        if (window.confirm('Bạn chuẩn bị xóa mục này\nBấm "OK" để tiếp tục, "Cancel" để hủy')) {
            e.preventDefault();
            $.ajax({
                url: $(this).attr('href'),
                type: 'DELETE',
                data: {
                    _token: window.Laravel.csrfToken,
                    _method: 'DELETE',
                }
            }).done(function (data) {
                if (data.results == true) {
                    // @TODO Why lỗi?
                    // $(this).parent().parent().hide();
                    alert(data.msg);
                    window.location.reload();
                }
            });
        }
        return false;
    })
})