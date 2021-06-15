$(document).ready(function() {
    $("#booknames").change(function() {
        var bid = $("#booknames").val();
        console.log(bid);
        $.ajax({
            url: 'data.php',
            method: 'post',
            data: 'bid=' + bid
        }).done(function(r_chapter) {
            console.log(r_chapter);
            r_chapter = JSON.parse(r_chapter);
            $('#r_chapter').empty();
            r_chapter.forEach(function(chapter) {
                $('#r_chapter').append('<option>' + chapter.chaptername + '</option>')
            })
        })

    })


    $("#r_chapter").change(function() {
        var cid = $("#r_chapter").val();
        console.log(cid);
        $.ajax({
            url: 'data.php',
            method: 'post',
            data: 'cid=' + cid
        }).done(function(r_verses) {
            console.log(r_verses);
            r_verses = JSON.parse(r_verses);
            $('#r_verses').empty();
            r_verses.forEach(function(verses) {
                $('#r_verses').append('<option>' + verses.id_verses + '</option>')
            })
        })

    })
})
