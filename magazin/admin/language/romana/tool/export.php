<?php
// Heading
$_['heading_title']     = 'Export / Import';

// Text
$_['text_success']      = 'Success: You have successfully imported your categories and products!';
$_['text_nochange']     = 'No server data has been changed.';
$_['text_log_details']  = 'See also \'System &gt; Error Logs\' for more details.';

// Entry
$_['entry_restore']             = 'Import from spreadsheet file:';
$_['entry_imp_prod']            = 'Product import from CSV file:';
$_['entry_imp_prod_o']          = 'Product option import from CSV file:';
$_['entry_imp_prod_o_comb']     = 'Product option combination import from CSV file:';

$_['entry_description'] = 'Use this function to export or import all your categories and products to or from a XLSX spreadsheet file.';

// Error
$_['error_permission']          = 'Warning: You do not have permission to modify exports/imports!';
$_['error_upload']              = 'Uploaded file is not a valid spreadsheet file or its values are not in the expected formats!';
$_['error_sheet_count']         = 'Export/Import: Invalid number of worksheets, 8 worksheets expected';
$_['error_categories_header']   = 'Export/Import: Invalid header in the Categories worksheet';
$_['error_products_header']     = 'Export/Import: Invalid header in the Products worksheet';
$_['error_options_header']      = 'Export/Import: Invalid header in the Options worksheet';
$_['error_attributes_header']   = 'Export/Import: Invalid header in the Attributes worksheet';
$_['error_specials_header']     = 'Export/Import: Invalid header in the Specials worksheet';
$_['error_discounts_header']    = 'Export/Import: Invalid header in the Discounts worksheet';
$_['error_rewards_header']      = 'Export/Import: Invalid header in the Rewards worksheet';
$_['error_select_file']         = 'Export/Import: Please select a file before clicking \'Import\'';
$_['error_post_max_size']       = 'Export/Import: File size is greater than %1 (see PHP setting \'post_max_size\')';
$_['error_upload_max_filesize'] = 'Export/Import: File size is greater than %1 (see PHP setting \'upload_max_filesize\')';

// Button labels
$_['button_import']     = 'Import';
$_['button_export']     = 'Export';
?>