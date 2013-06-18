{if $menu_title && !empty($menus)}
    <div id="sidebar-main-nav-list">
        <h2>{$menu_title|clean_for_attribute}</h2>
        {if !empty($menus)}
            <ul class="nav nav-list">
                {foreach from=$menus item=menu key=check}
                    {if $check !== 'community_list'}
                        {foreach from=$menu item=item key=alias name=sub_menu_loop}
                            <li>
                                {if strpos($alias, '#spacer') !== false}
                                    <span class="navSpacer">{$item->name|clean_for_attribute}</span>
                                {elseif $current_url == $alias || strpos($current_url, $alias) !== false}
                                    <a href="{$alias|replace:' ':'%20'}" class="sub_active_link" title="{$item->name|clean_for_attribute}">
                                        {$item->name|clean_for_attribute}
                                    </a>
                                {elseif $SECOND_LEVEL_PERSISTENCE_URI == $alias}
                                    <a href="{$alias|replace:' ':'%20'}" class="sub_active_link" title="{$item->name|clean_for_attribute}">
                                        {$item->name|clean_for_attribute}
                                    </a>
                                {else}
                                    <a href="{$alias|replace:' ':'%20'}" {if strpos( $alias, "exit?url" ) !== false || strpos( $alias, "http://" ) !== false || strpos( $alias, "https://" ) !== false} target="_blank"{/if} title="{$item->name|clean_for_attribute}">
                                        {$item->name|clean_for_attribute}
                                    </a>
                                {/if}
                                {if $child_menu && !empty($child_menu) && $child_parent_name == $item->name}
                                    <ul>
                                        {foreach from=$child_menu item=child_item key=child_alias name=child_menu_loop}
                                            <li{if $smarty.foreach.child_menu_loop.last} class="last-child"{/if}>
                                                {if $current_url == $child_alias || $selected_page_name == $child_item->name || $current_url|replace:' ':'%20' == $child_alias}
                                                    <a href="{$child_alias|replace:' ':'%20'}" class="sub_active_link{if $smarty.foreach.child_menu_loop.last} last{/if}" title="{$child_item->name|clean_for_attribute}">{$child_item->name|clean_for_attribute}</a>
                                                {else}
                                                    <a href="{$child_alias|replace:' ':'%20'}"{if strpos( $child_alias, "http://" ) !== false || strpos( $alias, "https://" ) !== false} target="_blank"{/if}{if $smarty.foreach.child_menu_loop.last} class="last"{/if} title="{$child_item->name|clean_for_attribute}">{$child_item->name|clean_for_attribute}</a>
                                                {/if}
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                            </li>
                        {/foreach}
                    {elseif $check === 'community_list'}
                        {foreach from=$menus.community_list item=menu key=alias}
                            {if $current_url == $alias}
                                <li>
                                    <a href="{$menu->uri}" class="sub_active_link" title="{$menu->name|clean_for_attribute}">{$menu->name|clean_for_attribute}</a>
                                </li>
                            {else}
                                <li>
                                    <a href="{$menu->uri}" title="{$menu->name|clean_for_attribute}">{$menu->name|clean_for_attribute}</a>
                                </li>
                            {/if}
                        {/foreach}
                    {/if}
                {/foreach}
            </ul>
        {/if}
    </div>
{/if}