{render_layout_arguments var="render_page_breadcrumbs"}
    <ul class="breadcrumb">
        <li><a href="/" title="{$account_area_brand_name}">Home</a></li>
        <li><a href="{$ACTION_URLS.account}" title="{$account_area_brand_name}">{$account_area_brand_name}</a></li>
        <li class="active">Home</li>
    </ul>
{/render_layout_arguments}
{$PAGE_MENU}
<div class="page-header web-user-account-header">
    <h1>We're Glad You're Here</h1>
    <p class="lead">
        Whether you're a buyer or seller, you can save time and simplify the process. Customize searches for properties, know when new properties that
        fit your search criteria come on the market or when prices change, and share properties easily. Our search capability includes MLS listings
        throughout the area so you have access to thousands of properties and new listings appear in our search engine within 24 hours of being listed. 
    </p>
</div>
<div id="web-user-account-home">
    <div class="row margin-top-30">
        <div class="col-sm-6">
            <h2><a href="{$ACTION_URLS.account}manage_favorites/">Favorites</a></h2>
            <p>
                Save, compare, manage and share your favorite properties.
            </p>
        </div>
        <div class="col-sm-6">
            <h2><a href="{$ACTION_URLS.account}searches/">Saved Searches</a></h2>
            <p>
                Manage and edit your saved searches to perform them again at a later time. Start or stop email alerts.
            </p>
        </div>
    </div>
    <div class="row margin-top-30">
        <div class="col-sm-6">
            <h2><a href="{$ACTION_URLS.account}edit/">Account Details</a></h2>
            <p>
                Review or edit your email address, contact information or password. You can also Manage your email setting or change your preferred agent.
            </p>
        </div>
        <div class="col-sm-6">
            <h2><a href="{$ACTION_URLS.account}contact_agent/">Preferred Agent</a></h2>
            <p>
                Contact your preferred agent and ask them a question.
            </p>
        </div>
    </div>
</div>