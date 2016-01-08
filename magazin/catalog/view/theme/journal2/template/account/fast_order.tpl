<?php echo $header; ?>

<?php if ($attention) { ?>
    <div class="attention"><?php echo $attention; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>

<?php if ($success) { ?>
    <div class="success"><?php echo $success; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>

<?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?><img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>
<?php } ?>

<?php echo $column_left; ?><?php echo $column_right; ?>
<div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
</div>
<div id="content"><?php echo $content_top; ?>
    <h1 class="heading-title"><?= $heading_title; ?></h1>

    <div class="fast_order_search">
        <div id="fast_order_search_form" class="xs-100 sm-50 md-50 lg-80 xl-80">
            <div class="search_part">
                <div class="filter_model xs-100 sm-50 md-50 lg-20 xl-20">
                    <p><?php echo $filter_model; ?></p>
                    <input type="text" value="" name="filter_model" class="ui-autocomplete-input" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true">
                    <input type="hidden" value="" id="filter_product_id" name="product_id" >
                </div>
                <div class="filter_name xs-100 sm-50 md-50 lg-20 xl-20">
                    <p><?php echo $filter_name; ?></p>
                    <input type="text" value="" name="filter_name" class="ui-autocomplete-input" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true">
                </div>
                <div class="filter_color xs-100 sm-50 md-50 lg-20 xl-20">
                    <p><?php echo $filter_color; ?></p>
                    <input type="hidden" value="" id="color_product_option_id" name="color_product_option_id">
                    <select disabled name="filter_color" id="color_product_option_value_id" name="option">
                        <option value=""><?= $select_color; ?></option>
                    </select>
                </div>
                <div class="filter_size xs-100 sm-50 md-50 lg-20 xl-20">
                    <p><?php echo $filter_size; ?></p>
                    <input type="text" value="" id="size_product_option_id" name="size_product_option_id" style="display: none;">
                    <select disabled name="filter_size" id="size_product_option_value_id" name="option">
                        <option value=""><?= $select_size; ?></option>
                    </select>
                </div>
                <div class="filter_config xs-100 sm-50 md-50 lg-20 xl-20">
                    <p><?php echo $filter_config; ?></p>
                    <input type="text" disabled value="" name="filter_config" class="ui-autocomplete-input" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true">
                </div>
            </div>
            <div class="search_part">
                <div class="filter_stoc xs-100 sm-50 md-50 lg-20 xl-20">
                    <p><?php echo $filter_stoc; ?></p>
                    <div></div>
                </div>
                <div class="filter_price xs-100 sm-50 md-50 lg-40 xl-40">
                    <p><?php echo $filter_price; ?></p>
                    <div></div>
                </div>
                <div class="filter_quantity xs-100 sm-50 md-50 lg-20 xl-20">
                    <p><?php echo $filter_quantity; ?></p>
                    <input type="text" disabled value="" name="quantity" class="ui-autocomplete-input" autocomplete="off" role="textbox" aria-autocomplete="list" aria-haspopup="true">
                </div>
                <div class="filter_total_price xs-100 sm-50 md-50 lg-20 xl-20">
                    <p><?php echo $filter_total_price; ?></p>
                    <div></div>
                    <input type="hidden" disabled value="" name="total_price">
                    <input type="hidden" disabled value="" name="currency">
                </div>
            </div>
        </div>
        <div id="fast_order_search_button_container" class="xs-100 sm-50 md-50 lg-20 xl-20">
            <a id="add_to_fast_order_list_btn" class="button" style="display: none">Adauga la lista</a>
        </div>
    </div>
    <div id="fast_order_list" class="xs-100 sm-100 md-100 lg-100 xl-100">

    </div>

    <div id="fast_order_list_mobile" class="xs-100 sm-100 md-100 lg-100 xl-100">

    </div>

    <?php echo $content_bottom; ?>
</div>

<script type="text/javascript">
    $( document ).ready(function() {

        resize_order_list();

        $(window).resize(resize_order_list);

        var option = [];
        $('input[name=\'filter_model\']').autocomplete({
            delay: 500,
            source: function(request, response) {
                $.ajax({
                    url: 'index.php?route=account/account/autocomplete&filter_model=' +  encodeURIComponent(request.term),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                label: item.model,
                                product_id: item.product_id,
                                product_name: item.name,
                                model: item.model,
                                option: item.option
                            }
                        }));
                    }
                });
            },
            select: function(event, ui) {
                console.log('pr naame '+ui.item.product_name);
                $('.filter_name > input').attr('value',ui.item.product_name);
                $('.filter_quantity > input').attr('disabled', true);
                $('#filter_product_id').attr('value',ui.item.product_id);
                console.log('from moodel insert product id '+ui.item.product_id);

                handle_options(ui.item.product_name, ui.item.product_id, ui.item.model, ui.item.option);
            },
            focus: function(event, ui) {
                return false;
            }
        });
        $('input[name=\'filter_name\']').autocomplete({
            delay: 500,
            source: function(request, response) {
                $.ajax({
                    url: 'index.php?route=account/account/autocomplete&filter_name=' +  encodeURIComponent(request.term),
                    dataType: 'json',
                    success: function(json) {
                        response($.map(json, function(item) {
                            return {
                                label: item.name,
                                product_id: item.product_id,
                                product_name: item.name,
                                model: item.model,
                                option: item.option
                            }
                        }));
                    }
                });
            },
            select: function(event, ui) {
                $('.filter_model > input').attr('value',ui.item.model);
                $('.filter_quantity > input').attr('disabled', true);
                $('#filter_product_id').attr('value',ui.item.product_id);
                console.log('from name insert product id '+ui.item.product_id);

                handle_options(ui.item.product_name, ui.item.product_id, ui.item.model, ui.item.option);
            },
            focus: function(event, ui) {
                return false;
            }
        });

        $('.filter_color > select').change(function() {
            //console.log($(this).attr('name'));
            if($('.filter_color > select > option:selected').val() > 0) {
                $('.filter_quantity > input').attr('value','');
                $('.filter_total_price > div').html('');
                var product_option_value_id = $('.filter_color > select > option:selected').val();
                var color_product_option_id = $('#color_product_option_id').val();
                console.log('option array '+ product_option_value_id);
                $(this).css('background','#FFF');
                call_live_price_update();
            } else {
                $('.filter_color > select').css('background','#F0EE4E');
            }
        });

        $('.filter_size > select').on('change' ,function() {
            //console.log($(this).attr('name'));
            if($('.filter_size > select > option:selected').val() > 0) {
                $('.filter_quantity > input').attr('value','');
                $('.filter_total_price > div').html('');
                var product_option_value_id = $('.filter_size > select > option:selected').val();
                var size_product_option_id = $('#size_product_option_id').val();
                console.log('option array '+ product_option_value_id);
                $(this).css('background','#FFF');
                call_live_price_update();
            } else {
                $('.filter_size > select').css('background','#F0EE4E');
            }
        });

        $('.filter_quantity > input').keyup('change' ,function(event) {
            //console.log($(this).attr('name'));
            if($('.filter_quantity > input').val() > 0) {
                console.log('quantity OK');
                var product_option_value_id = $('.filter_quantity > input').val();
                var size_product_option_id = $('#size_product_option_id').val();
                call_live_price_update();
                if (event.keyCode == '13') {
                    add_to_fast_order_list();
                }
            } else {
                console.log('quantity WRONG');
                $('.filter_total_price > div').html('');
                $('#add_to_fast_order_list_btn').hide();
            }
        });

        $('#add_to_fast_order_list_btn').on('click', function() {
            add_to_fast_order_list();
        });
    });

    $('#add_to_cart_btn').live('click', function() {
        $( "#fast_order_list > .product_to_order_line" ).each(function( index ) {
            console.log("element " +index+ ": " + $( this ).html() );
            console.log($(this).find(" input[type=\'hidden\'], input[type=\'hidden\']"));
            $.ajax({
                url: 'index.php?route=checkout/cart/add',
                type: 'post',
                data: $(this).find(" input[type=\'hidden\'], input[type=\'hidden\']"),
                dataType: 'json',
                async: false,
                success: function(json) {
                    $('.success, .warning, .attention, information, .error').remove();

                    if (json['error']) {
                        if (json['error']['option']) {
                            for (i in json['error']['option']) {
                                $('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
                            }
                        }

                        if (json['error']['profile']) {
                            $('select[name="profile_id"]').after('<span class="error">' + json['error']['profile'] + '</span>');
                        }
                    }

                    if (json['success']) {
                        $('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/default/image/close.png" alt="" class="close" /></div>');

                        $('.success').fadeIn('slow');

                        $('#cart-total').html(json['total']);

                        $('html, body').animate({ scrollTop: 0 }, 'slow');
                    }
                }
            });
        });
    });

    $('.delete_product_line').live('click', function() {

        $(this).closest('.product_to_order_line').prev('hr').remove();
        $(this).closest('.product_to_order_line').remove();

        var list_size = $('#fast_order_list').find('.product_to_order_line').html();

        if(list_size < 5){
            console.log('delete whole list '+list_size);
            $('#fast_order_list').html('');
        } else {
            console.log('delete line '+list_size);
            calculate_product_to_order_list_total();
        }

    });

    function add_to_fast_order_list() {
        if($.trim($("#fast_order_list").html())==''){
            console.log('emprty liiist');
            var product_to_order_list_head = '<div class="product_to_order_list_head">';
            product_to_order_list_head += '<div class="product_to_order_name xs-100 sm-100 md-100">'+$('.filter_name > p').html()+'</div>';
            product_to_order_list_head += '<div class="product_to_order_model xs-100 sm-100 md-100">'+$('.filter_model > p').html()+'</div>';
            product_to_order_list_head += '<div class="product_to_order_stoc xs-100 sm-100 md-100">'+$('.filter_stoc > p').html()+'</div>';
            product_to_order_list_head += '<div class="product_to_order_quantity xs-100 sm-100 md-100">'+$('.filter_quantity > p').html()+'</div>';
            product_to_order_list_head += '<div class="product_to_order_price xs-100 sm-100 md-100">'+$('.filter_price > p').html()+'</div>';
            product_to_order_list_head += '<div class="product_to_order_total_price xs-100 sm-100 md-100">'+$('.filter_total_price > p').html()+'</div>';
            product_to_order_list_head += '</div>';
            $('#fast_order_list').append(product_to_order_list_head);
            $('#fast_order_list_mobile').append(product_to_order_list_head);

            $('#fast_order_list').append('<div class="fast_order_list_bottom xs-100 sm-100 md-100 lg-100 xl-100"><div class="xs-65 sm-50 md-50 lg-50 xl-50"><a id="add_to_cart_btn" class="button ">Adaugare in cos</a></div><div id="fast_order_list_total" class="xs-50 sm-50 md-50 lg-50 xl-50"><b>Total - '+$('.filter_total_price > div').html()+'</b></div></div>');
            $('#fast_order_list_mobile').append('<div class="fast_order_list_bottom xs-100 sm-100 md-100 lg-100 xl-100"><div class="xs-55 sm-50 md-50 lg-50 xl-50"><a id="add_to_cart_btn" class="button ">Adaugare in cos</a></div><div id="fast_order_list_total" class="xs-45 sm-50 md-50 lg-50 xl-50"><b>Total - '+$('.filter_total_price > div').html()+'</b></div></div>');
        }

        var html = '';

        var product_id = $('#filter_product_id').val();
        var product_model = $('.filter_model > input').val();
        var product_name = $('.filter_name > input').val();
        var color_product_option_id = $('#color_product_option_id').val();
        var color_product_option_name = $(".filter_color > p").html();
        var color_product_option_value_id = $('#color_product_option_value_id').val();
        var color_product_option_value_text = $("#color_product_option_value_id > option:selected").html();
        var size_product_option_id = $('#size_product_option_id').val();
        var size_product_option_name = $(".filter_size > p").html();
        var size_product_option_value_id = $('#size_product_option_value_id').val();
        var size_product_option_value_text = $("#size_product_option_value_id > option:selected").html();
        var stoc = $('.filter_stoc > div').html();
        var quantity = $('.filter_quantity > input').val();
        var price_text = $('.filter_price > div').html();
        var total_price = $('.filter_total_price > input[name=total_price]').val();
        var currency = $('.filter_total_price > input[name=currency]').val();
        var total_price_text = $('.filter_total_price > div').html();

        console.log('Product ID: '+product_id+' Model '+product_model+' Name '+ product_name+' Color '+ color_product_option_id+' '+color_product_option_value_id);

        var product_to_order = '<div class="product_to_order_line xs-100 sm-100 md-100 lg-100 xl-100"><div class="product_to_order_name xs-100 sm-100 md-100"><div class="xs-60 sm-60 md-60"><h3>'+product_name+'</h3>';

        product_to_order += '<input type="hidden" id="product_id" name="product_id" value="'+product_id+'" >';

        if(color_product_option_id > 0 && color_product_option_value_id > 0){
            product_to_order += '<p>'+color_product_option_name+' - '+color_product_option_value_text+'</p>';
            product_to_order += '<input type="hidden" id="color_product_option_id" name="option['+color_product_option_id+']" value="'+color_product_option_value_id+'" >';
        }

        if(size_product_option_id > 0 && size_product_option_value_id > 0){
            product_to_order += '<p>'+size_product_option_name+' - '+size_product_option_value_text+'</p>';
            product_to_order += '<input type="hidden" id="size_product_option_id" name="option['+size_product_option_id+']" value="'+size_product_option_value_id+'" >';
        }

        product_to_order += '</div></div>'; // close product_to_order_name div

        product_to_order += '<div class="product_to_order_model xs-100 sm-100 md-100"><div class="xs-60 sm-60 md-60">'+product_model+'</div></div>';

        product_to_order += '<div class="product_to_order_stoc xs-100 sm-100 md-100"><div class="xs-60 sm-60 md-60">'+stoc+'</div></div>';

        product_to_order += '<div class="product_to_order_quantity xs-100 sm-100 md-100"><div class="xs-60 sm-60 md-60"><span>'+quantity+'</span><input type="hidden" id="quantity" name="quantity" value="'+quantity+'" ></div></div>';

        product_to_order += '<div class="product_to_order_price xs-100 sm-100 md-100"><div class="xs-60 sm-60 md-60">'+price_text+'</div></div>';

        product_to_order += '<div class="product_to_order_total_price xs-100 sm-100 md-100" data-total="'+total_price+'" data-currency="'+currency+'"><div class="xs-60 sm-60 md-60">'+total_price_text+'</div></div>';

        product_to_order += '<div class="delete_product"><a class="button delete_product_line">Eliminare</a></div>'

        product_to_order += '</div>';

        $("#fast_order_list_mobile").find(".product_to_order_list_head").remove();

        //$(product_to_order).insertAfter('.product_to_order_list_head');
        $("#fast_order_list_mobile").prepend(product_to_order);

        $(product_to_order).insertAfter('.product_to_order_list_head');

        $("#fast_order_list_mobile > div:first-child").each(function(){
            $(this).find('.product_to_order_name').prepend('<div class="xs-40 sm-40 md-40"><h3>Denumire articol: </h3></div>');
            $(this).find('.product_to_order_model').prepend('<div class="xs-40 sm-40 md-40">Cod articol: </div>');
            $(this).find('.product_to_order_stoc').prepend('<div class="xs-40 sm-40 md-40">Stoc: </div>');
            $(this).find('.product_to_order_quantity').prepend('<div class="xs-40 sm-40 md-40">Cantitate comanda: </div>');
            $(this).find('.product_to_order_price').prepend('<div class="xs-40 sm-40 md-40">Pret unitar: </div>');
            $(this).find('.product_to_order_total_price').prepend('<div class="xs-40 sm-40 md-40">Valoare comanda: </div>');
        });

        //$('#fast_order_list_mobile').append('<hr>'+product_to_order);

        /*var product_id = $('#filter_product_id').attr('value');
         var option = $('.filter_color > select[name^="option"]');
         var quantity = $('.filter_quantity > input').attr('value');
         console.log('coming soon '+ product_id+' quantity '+quantity+' options '+option);
         $.each(option, function(key, value){
         console.log('key '+key);
         console.log('value '+value);
         });*/

        calculate_product_to_order_list_total();
    }

    function calculate_product_to_order_list_total() {
        var product_to_order_list_total = parseFloat(0);

        $('#fast_order_list > .product_to_order_line').each(function(index) {

            product_to_order_list_total += parseFloat($(this).find('.product_to_order_total_price').attr('data-total'));
            currency = $(this).find('.product_to_order_total_price').attr('data-currency');

            console.log('Total '+product_to_order_list_total+' currency '+currency);
        });
        $('#fast_order_list_total > b').html('Total - '+product_to_order_list_total.toFixed(2)+currency);
    }

    function handle_options(product_name, product_id, model, option_data){
        $('.filter_color > select').prop('disabled', true);
        $('.filter_color > select').css('background','#CCC');
        $('.filter_color > select').find('option').remove().end();
        $('.filter_size > select').prop('disabled', true);
        $('.filter_size > select').css('background','#CCC');
        $('.filter_size > select').find('option').remove().end();

        $('#add_to_fast_order_list_btn').hide();

        console.log('delete options');
        $('#color_product_option_id').removeAttr('value');
        $('#color_product_option_value_id').attr('name','filter_color');
        $('#size_product_option_id').removeAttr('value');
        $('#size_product_option_value_id').attr('name','filter_size');
        $('.filter_quantity > input').removeAttr('value');
        $('.filter_total_price > div').html('');

        $('.filter_price > div').html('');

        if(option_data.length > 0) {
            $.each(option_data, function(key, value) {
                if(value.option_id == '2'){ // If have color option
                    $('.filter_color').show();
                    $('#color_product_option_id').attr('value',value.product_option_id);
                    $('.filter_color > select').prop('disabled', false);
                    $('.filter_color > select').attr('name','option['+value.product_option_id+']');
                    $('.filter_color > select').css('background','#F0EE4E');
                    $('.filter_color > select').append('<option>'+value.place_holder+'</option>');
                }
                if(value.option_id == '1'){ // If have size option
                    $('.filter_size').show();
                    $('#size_product_option_id').attr('value',value.product_option_id);
                    $('.filter_size > select').prop('disabled', false);
                    $('.filter_size > select').attr('name','option['+value.product_option_id+']');
                    $('.filter_size > select').css('background','#F0EE4E');
                    $('.filter_size > select').append('<option>'+value.place_holder+'</option>');
                }
            });
            $.ajax({
                url: 'index.php?route=account/account/getProductOptions&product_id=' +  encodeURIComponent(product_id),
                dataType: 'json',
                success: function(json) {
                    $.each(json, function(key, value) {
                        if(value.option_id == 1) {
                            $.each(value.option_value, function (key, option) {
                                $('.filter_size > select').attr('data-product_option_id',value.product_option_id);
                                $('.filter_size > select').append('<option value="' + option.product_option_value_id + '">' + option.name + '</option>');
                            });
                        }

                        if(value.option_id == 2) {

                            $.each(value.option_value, function (key, option) {
                                $('.filter_color > select').attr('data-product_option_id',value.product_option_id);
                                $('.filter_color > select').append('<option value="' + option.product_option_value_id + '">' + option.name + '</option>');
                            });
                        }
                    });
                }
            });
        } else {
            $('.filter_quantity > input').attr('disabled', false);
            call_live_price_update(product_id, option_data);
        }

        return false;
    }

    function call_live_price_update(product_id) {
        console.log('call_live_price_update '+$('input[name^="product_id"]')+ ' Option_data: '+$('select[name^="option"]'));

        $.ajax({
            type: 'post',
            url: 'index.php?route=myoc/fast_order_live_price_update',
            dataType: 'json',
            data: $('.filter_model > input[name="product_id"], select[name^="option"], .filter_quantity > input[name="quantity"]'),
            success: function (json) {
                console.log(json);
                if ( json.customer_group_id == 3 || json.customer_group_id == 4) // B2B client
                {
                    if (json.have_b2b_price != 0)  //&& myocData.b2b_product_stoc != 0
                    {
                        $('.filter_price').find('div').text(json.price_and_text);
                    }
                    $('.filter_stoc').find('div').text(json.b2b_product_stoc);
                    $('.filter_quantity').find('input').attr('disabled', false);
                } else {
                    $('.filter_price').find('div').text(json.price_and_text);
                    $('.filter_price').find('#price_with_tax').text(json.price_with_tax);
                    $('.filter_stoc').find('div').text(json.stoc);
                }
                $('.filter_quantity > input').attr('disabled', false);
                if($('.filter_quantity > input').val() > 0){
                    $('.filter_total_price').find('div').text(json.total_price_and_text);
                    $('.filter_total_price').find('input[name=total_price]').attr('value',json.total_price);
                    $('.filter_total_price').find('input[name=currency]').attr('value',json.currency);

                    $('#fast_order_search_button_container > a').show();
                }
            }
        });
    }

    function resize_order_list() {
        if ($(window).width() < 700) {
            $('#fast_order_list').hide();
            $('#fast_order_list_mobile').show();
        } else {
            $('#fast_order_list').show();
            $('#fast_order_list_mobile').hide();
        }
    }

</script>


    <?php echo $footer; ?>