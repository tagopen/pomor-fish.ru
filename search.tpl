<?php echo $header; ?>
<div class="hidden-xs">
  <div class="breadcrumb_line">
    <div class="container">
      <div class="row">
        <div class="col-md-9 breadcrumba">
            <?php // vpk
            $last_idx = sizeof($breadcrumbs) - 1;
            ?>
            <?php foreach ($breadcrumbs as $j=>$breadcrumb) { ?>
              <?php if($j==$last_idx){ ?>
            <?php echo $breadcrumb['separator']; ?><?php echo $breadcrumb['text']; ?>
              <?php }else{ ?>
            <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
              <?php } ?>
            <?php } ?>
        </div>
        <div class="col-md-3 ">
          <form id="top-search-form" action="<?php echo $search_href;?>" class="search_main">
          <input type="text" name="search" placeholder="Поиск по сайту" class="form-control">
          <span class="btn_search" onclick="$('#top-search-form').submit();"></span>
          <input type="button" class="btn_submit" onclick="$('#top-search-form').submit();">
          </form>
        </div>
      </div>
    </div>
  </div>
</div>
<div class="wrapper main_back">
  <div class="container search_page_t">
    <div class="row">
      <div class="col-md-12 no_right_padding">
        <div class="clearfix product_back">
          <?php echo $content_top; ?>
          <div class="title-box title_big">
            <h1 class="title"><?php echo $heading_title; ?></h1>
          </div>
          <b><?php echo $text_critea; ?></b>
          <div class="content">
            <p><?php echo $entry_search; ?>
            <?php if ($filter_name) { ?>
            <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" />
            <?php } else { ?>
            <input type="text" name="filter_name" value="<?php echo $filter_name; ?>" onclick="this.value = '';" onkeydown="this.style.color = '000000'" style="color: #999;" />
            <?php } ?>
            <select name="filter_category_id">
            <option value="0"><?php echo $text_category; ?></option>
            <?php foreach ($categories as $category_1) { ?>
            <?php if ($category_1['category_id'] == $filter_category_id) { ?>
            <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_1['children'] as $category_2) { ?>
            <?php if ($category_2['category_id'] == $filter_category_id) { ?>
            <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
            <?php } ?>
            <?php foreach ($category_2['children'] as $category_3) { ?>
            <?php if ($category_3['category_id'] == $filter_category_id) { ?>
            <option value="<?php echo $category_3['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $category_3['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_3['name']; ?></option>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            </select>
            <?php if ($filter_sub_category>0) { ?>
            <input type="checkbox" name="filter_sub_category" value="1" id="sub_category" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="filter_sub_category" value="1" id="sub_category" />
            <?php } ?>
            <label for="sub_category"><?php echo $text_sub_category; ?></label>
            </p>
            <?php if ($filter_description>0) { ?>
            <input type="checkbox" name="filter_description" value="1" id="description" checked="checked" />
            <?php } else { ?>
            <input type="checkbox" name="filter_description" value="1" id="description" />
            <?php } ?>
            <label for="description"><?php echo $entry_description; ?></label>
          </div>
          <div class="buttons">
            <div class="right"><input type="button" value="<?php echo $button_search; ?>" id="button-search" class="button" /></div>
          </div>
          <?php if('all'===$search_type || 'cat'===$search_type){ // vpk ?>
          <h2><?php echo $text_search; ?></h2>
          <?php if ($products) { ?>
          <div class="product-filter">
            <div class="display"><b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display('grid');"><?php echo $text_grid; ?></a></div>
            <div class="limit"><?php echo $text_limit; ?>
              <select onchange="location = this.value;">
                <?php foreach ($limits as $limits) { ?>
                <?php if ($limits['value'] == $limit) { ?>
                <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
            <div class="sort"><?php echo $text_sort; ?>
              <select onchange="location = this.value;">
                <?php foreach ($sorts as $sorts) { ?>
                <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
                <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
                <?php } else { ?>
                <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
                <?php } ?>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="row product-list">
            <?php foreach ($products as $product) { ?>
            <div class="col-md-3 col-sm-6 col-xs-12 product-cols">
              <?php if ($product['thumb']) { ?>
              <div class="image">
                <a href="<?php echo $product['href']; ?>">
                  <img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
                </a>
              </div>
              <?php } ?>
              <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
              <div class="description"><?php echo $product['description']; ?></div>
              <?php if ($product['price']) { ?>
              <div class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <br />
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </div>
              <?php } ?>
              <?php if ($product['rating']) { ?>
              <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
              <?php } ?>
              <div class="cart"><input type="button" value="<?php echo $button_cart; ?>" onclick="addToCart('<?php echo $product['product_id']; ?>');" class="button" /></div>
              <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');"><?php echo $button_wishlist; ?></a></div>
              <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');"><?php echo $button_compare; ?></a></div>
            </div>
            <?php } ?>
          </div>
          <div class="pagination"><?php echo $pagination; ?></div>
          <?php } else { ?>
          <div class="content"><?php echo $text_empty; ?></div>
          <?php }?>
          <?php } // end vpk ?>
          <?php echo $content_bottom; ?>
        </div>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript"><!--
$('#content input[name=\'filter_name\']').keydown(function(e) {
  if (e.keyCode == 13) {
    $('#button-search').trigger('click');
  }
});
$('#button-search').bind('click', function() {
  var url = 'index.php?route=product/search';
  var ob = $('div.content');

  if(ob.length)
  {
  
  var filter_name = ob.find('input[name=\'filter_name\']').attr('value');
  if (filter_name) {
    url += '&search=' + encodeURIComponent(filter_name);
  }
  
  var filter_category_id = ob.find('select[name=\'filter_category_id\'] option:selected').val();
  if (filter_category_id > 0) {
    url += '&filter_category_id=' + encodeURIComponent(filter_category_id);
  }
  
  var filter_sub_category = $('#sub_category').is(':checked') ? 1 : 0;
  if (filter_sub_category) {
    url += '&filter_sub_category=1';
  }
  
  var ob_search_type = $('#search_type');
  var search_type = ob_search_type.length ? ob_search_type.find(':selected').val() : 'all';
  if(!(search_type=='all' || search_type=='cat' || search_type=='info')){
    search_type = 'all';
  }
  url += '&search_type='+search_type;
  
  var filter_description = $('#description').is(':checked') ? 1 : 0;
  if (filter_description) {
    url += '&filter_description=1';
  }
  }
  location = url;
});

function display(view) {
  if (view == 'list') {
    $('.product-grid').attr('class', 'product-list');
    $('.product-list > div').each(function(index, element) {
      html  = '<div class="right">';
      html += '</div>';     
      html += '<div class="left">';
      var image = $(element).find('.image').html();
      if (image != null) { 
        html += '<div class="image">' + image + '</div>';
      }
      html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
      var price = $(element).find('.price').html();
      if (price != null) {
        html += '<div class="price">' + price  + '</div>';
      }
      html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';    
      var rating = $(element).find('.rating').html();
      if (rating != null) {
        html += '<div class="rating">' + rating + '</div>';
      }
      html += '</div>';
      $(element).html(html);
    }); 
    $('.display').html('<b><?php echo $text_display; ?></b> <?php echo $text_list; ?> <b>/</b> <a onclick="display(\'grid\');"><?php echo $text_grid; ?></a>');
    $.cookie('display', 'list'); 
  } else {
    $('.product-list').attr('class', 'product-grid');
    $('.product-grid > div').each(function(index, element) {
      html = '';
      var image = $(element).find('.image').html();
      if (image != null) {
        html += '<div class="image">' + image + '</div>';
      }
      html += '<div class="name">' + $(element).find('.name').html() + '</div>';
      var price = $(element).find('.price').html();
      if (price != null) {
        html += '<div class="price">' + price  + '</div>';
      } 
      var rating = $(element).find('.rating').html();
      if (rating != null) {
        html += '<div class="rating">' + rating + '</div>';
      }
      html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
      $(element).html(html);
    }); 
    $('.display').html('<b><?php echo $text_display; ?></b> <a onclick="display(\'list\');"><?php echo $text_list; ?></a> <b>/</b> <?php echo $text_grid; ?>');
    $.cookie('display', 'grid');
  }
}
view = $.cookie('display');
if (view) {
  display(view);
} else {
  display('list');
}
//--></script> 
<?php echo $footer; ?>