<div id="cart" class="btn-group btn-block">
    <button type="button" data-toggle="dropdown" data-loading-text="<?php echo $text_loading; ?>"
            class="btn btn-inverse btn-block btn-lg dropdown-toggle"><i class="fa fa-shopping-cart"></i> <span
                id="cart-total"><?php echo $text_items; ?></span></button>
    <ul class="dropdown-menu pull-right">
        <?php if ($products || $vouchers) { ?>
        <li>


            <table class="table table-striped">

                <div id="addtocart" class="modal modal-big modal-cart">
                    <h3 class="title modal-title">Моя корзина</h3>
                    <p class="modal-text text-center hidden">В корзине пока нет товаров</p>
                    <div class="cart-items-wrap">
                        <div class="mini-titles hidden-xs">
                            <div class="row min">
                                <div class="col-sm-7"><span>Название товара</span></div>
                                <div class="col-sm-3 text-center"><span>Количество</span></div>
                                <div class="col-sm-2 text-right"><span>Сума</span></div>
                            </div>
                        </div>
                    </div>
                    <?php foreach ($products as $product) { ?>
                    <!-- item -->
                    <div class="cart-item">
                        <div class="row min">
                            <!-- item info -->
                            <div class="col-sm-7">
                                <div class="cart-item-content">

                                    <div class="cart-item-img"><?php if ($product['thumb']) { ?>
                                        <a href="<?php echo $product['href']; ?>"><img
                                                    src="<?php echo $product['thumb']; ?>"
                                                    alt="<?php echo $product['name']; ?>"
                                                    title="<?php echo $product['name']; ?>"
                                                    class="img-thumbnail"/></a>
                                        <?php } ?>
                                    </div>

                                    <div class="cart-item-text">
                                        <a class="cart-item-title"
                                           href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                                        <span class="cart-item-price-wrap">
										<span class="cart-item-price"><?php echo $product['price']; ?></span>
										<span class="cart-item-price_old">3324 грн</span>
									</span>
                                    </div>

                                </div>
                            </div>

                            <!-- item quantity -->
                            <div class="col-sm-3 col-xs-6">
                                <div class="cart-item-count">
                                    <form class="form-counter">
                                        <button id="plus_item" class="input_control input_minus">
										<span class="icon icon_control">
											<svg>
												<use xlink:href="#icon_minus"></use>
											</svg>
										</span>
                                        </button>

                                        <input type="text" id="item_count" class="input input_count" value="<?php echo $product['quantity']; ?>">

                                        <button class="input_control input_plus">
										<span class="icon icon_control">
											<svg>
												<use xlink:href="#icon_plus"></use>
											</svg>
										</span>
                                        </button>
                                    </form>
                                </div>
                            </div>

                            <!-- item sum -->
                            <div class="col-sm-2 col-xs-6">
                                <div class="cart-item-sum">
                                    <span class="cart-item-sum-text"><?php echo $product['total']; ?></span>
                                </div>
                            </div>

                            <!-- item delete button -->
                            <button class="delete-item" onclick="cart.remove('<?php echo $product['cart_id']; ?>')"
                                    title="Удалить">
						<span class="icon">
							<svg>
								<use xlink:href="#icon_cross"></use>
							</svg>
						</span>
                            </button>
                        </div>
                    </div>
                    <?php } ?>
                </div>


                <?php foreach ($products as $product) { ?>
                <tr>
                    <td class="text-center"><?php if ($product['thumb']) { ?>
                        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>"
                                                                       alt="<?php echo $product['name']; ?>"
                                                                       title="<?php echo $product['name']; ?>"
                                                                       class="img-thumbnail"/></a>
                        <?php } ?></td>
                    <td class="text-left"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
                        <?php if ($product['option']) { ?>
                        <?php foreach ($product['option'] as $option) { ?>
                        <br/>
                        -
                        <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small>
                        <?php } ?>
                        <?php } ?>
                        <?php if ($product['recurring']) { ?>
                        <br/>
                        -
                        <small><?php echo $text_recurring; ?> <?php echo $product['recurring']; ?></small>
                        <?php } ?></td>
                    <td class="text-right">x <?php echo $product['quantity']; ?></td>
                    <td class="text-right"><?php echo $product['total']; ?></td>
                    <td class="text-center">
                        <button type="button" onclick="cart.remove('<?php echo $product['cart_id']; ?>');"
                                title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i
                                    class="fa fa-times"></i></button>
                    </td>
                </tr>
                <?php } ?>
                <?php foreach ($vouchers as $voucher) { ?>
                <tr>
                    <td class="text-center"></td>
                    <td class="text-left"><?php echo $voucher['description']; ?></td>
                    <td class="text-right">x&nbsp;1</td>
                    <td class="text-right"><?php echo $voucher['amount']; ?></td>
                    <td class="text-center text-danger">
                        <button type="button" onclick="voucher.remove('<?php echo $voucher['key']; ?>');"
                                title="<?php echo $button_remove; ?>" class="btn btn-danger btn-xs"><i
                                    class="fa fa-times"></i></button>
                    </td>
                </tr>
                <?php } ?>
            </table>
        </li>
        <li>
            <div>
                <table class="table table-bordered">
                    <?php foreach ($totals as $total) { ?>
                    <tr>
                        <td class="text-right"><strong><?php echo $total['title']; ?></strong></td>
                        <td class="text-right"><?php echo $total['text']; ?></td>
                    </tr>
                    <?php } ?>
                </table>
                <p class="text-right"><a href="<?php echo $cart; ?>"><strong><i
                                    class="fa fa-shopping-cart"></i> <?php echo $text_cart; ?></strong></a>&nbsp;&nbsp;&nbsp;<a
                            href="<?php echo $checkout; ?>"><strong><i
                                    class="fa fa-share"></i> <?php echo $text_checkout; ?></strong></a></p>
            </div>
        </li>
        <?php } else { ?>
        <li>
            <p class="text-center"><?php echo $text_empty; ?></p>
        </li>
        <?php } ?>
    </ul>
</div>
