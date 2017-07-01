            <!-- 
				ASIDE 
				Keep it outside of #wrapper (responsive purpose)
			-->
			<aside id="aside">
				
				<nav id="sideNav"><!-- MAIN MENU -->
					<ul class="nav nav-list">
						<li {if $section eq "dashboard"}class="active" {/if}><!-- dashboard -->
                            <!-- warning - url used by default by ajax (if eneabled) -->
							<a class="dashboard" href="{$adminurl}/dashboard.php">
								<i class="main-icon fa fa-dashboard"></i> <span>{$lang7}</span>
							</a>
						</li>
                        <li {if $section eq "users_manager"}class="active"{/if}>
							<a href="#">
								<i class="fa fa-menu-arrow pull-right"></i>
								<i class="main-icon fa fa-users "></i> <span>{$lang6}</span>
							</a>
							<ul><!-- submenus -->
								<li {if $page eq "users"}class="active"{/if}><a href="{$adminurl}/users.php" >فهرست کاربران</a></li>
								<li {if $page eq "usersgroup"}class="active"{/if}><a href="{$adminurl}/users.group.php">{$lang20}</a></li>
								<li {if $page eq "usersacl"}class="active"{/if}><a href="{$adminurl}/users.acl">{$lang21}</a></li>
							</ul>
						</li>
						
                        <li {if $section eq "settings"}class="active"{/if}>
							<a href="#">
								<i class="fa fa-menu-arrow pull-right"></i>
								<i class="main-icon fa fa-gear "></i> <span>تنظیمات</span>
							</a>
							<ul><!-- submenus -->
								<li {if $page eq "setting_basic"}class="active"{/if}><a href="{$adminurl}/setting.php" >تنظیمات سامانه</a></li>
								<li {if $page eq "setting_seo"}class="active"{/if}><a href="{$adminurl}/setting.seo.php">تنظیمات سئو</a></li>
								<li {if $page eq "setting_store"}class="active"{/if}><a href="{$adminurl}/setting.shop.php">تنظیمات فروشگاه</a></li>
							</ul>
						</li>
                        
                        
						
						
						
						
					</ul>

					<!-- SECOND MAIN LIST -->
					<h3>{$lang17}</h3>
					<ul class="nav nav-list">
                    
                        <li {if $section eq "shop"}class="active"{/if}>
							<a href="#">
								<i class="fa fa-menu-arrow pull-right"></i>
								<i class="main-icon fa fa-shopping-cart"></i> <span>مدیریت فروشگاه</span>
							</a>
							<ul><!-- submenus -->

								<li {if $page eq "shop_catalog"}class="active"{/if}><a href="{$adminurl}/shop.catalog.php">فهرست محصولات</a></li>
								<li {if $page eq "shop_categories"}class="active"{/if}><a href="{$adminurl}/shop.categories.php">دسته‌بندی محصولات</a></li>
								<li {if $page eq "shop_package"}class="active"{/if}><a href="{$adminurl}/shop.packages.php">بسته‌بندی محصولات</a></li>
								<li {if $page eq "shop_orders"}class="active"{/if}><a href="{$adminurl}/shop.orders.php">فهرست سفارشات</a></li>
								

							</ul>
						</li>
                        
						
					</ul>

				</nav>

				<span id="asidebg"><!-- aside fixed background --></span>
			</aside>
			<!-- /ASIDE -->