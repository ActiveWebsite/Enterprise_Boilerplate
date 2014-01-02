{if $menu_title && !empty($menus)}
    <div id="sidebar-main-nav-list">
        <h2>{$menu_title|clean_for_attribute}</h2>
        {if !empty($menus)}
            <ul>
                {foreach from=$menus item=menu key=check}
                    {if $check !== 'community_list'}
                        {foreach from=$menu item=item key=alias name=sub_menu_loop}
                            <li{if ($current_url == $alias || strpos($current_url, $alias) !== false) || ($SECOND_LEVEL_PERSISTENCE_URI == $alias)} class="active"{/if}>
                                {if strpos($alias, '#spacer') !== false}
                                    <span class="navSpacer">{$item->name|clean_for_attribute}</span>
                                {else}
                                    <a href="{$alias|replace:' ':'%20'}"{if strpos( $alias, "exit?url" ) !== false || strpos( $alias, "http://" ) !== false || strpos( $alias, "https://" ) !== false} target="_blank"{/if} title="{$item->name|clean_for_attribute}">
                                        {$item->name|clean_for_attribute}
                                    </a>
                                {/if}
                                {if $child_menu && !empty($child_menu) && $child_parent_name == $item->name}
                                    <ul>
                                        {foreach from=$child_menu item=child_item key=child_alias name=child_menu_loop}
                                            <li{if $current_url == $child_alias || $selected_page_name == $child_item->name || $current_url|replace:' ':'%20' == $child_alias} class="active"{/if}>
                                                <a href="{$child_alias|replace:' ':'%20'}"{if strpos( $child_alias, "exit?url" ) !== false || strpos( $child_alias, "http://" ) !== false || strpos( $child_alias, "https://" ) !== false} target="_blank"{/if} title="{$child_item->name|clean_for_attribute}">{$child_item->name|clean_for_attribute}</a>
                                            </li>
                                        {/foreach}
                                    </ul>
                                {/if}
                            </li>
                        {/foreach}
                    {elseif $check === 'community_list'}
                        {foreach from=$menus.community_list item=menu key=alias}
                            <li{if $current_url == $alias}  class="active"{/if}>
                                <a href="{$menu->uri}" title="{$menu->name|clean_for_attribute}">{$menu->name|clean_for_attribute}</a>
                            </li>
                        {/foreach}
                    {/if}
                {/foreach}
            </ul>
        {/if}
    </div>
{/if}
