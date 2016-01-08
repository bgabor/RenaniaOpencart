<?php if ($reminders) { ?>
<div class="acr-information"><?php echo $text_send_all; ?><a onclick="reminderShow('send');" class="acr-button" style="position:absolute; top:5px; right:10px;"><?php echo $button_send_all; ?></a></div>
<?php } ?>

<table class="list">
<thead>
  <tr>
	<td class="left"><?php echo $column_customer; ?></td>
	<td class="left"><?php echo $column_cart_content; ?></td>
	<td class="left"><?php echo $column_last_visit; ?></td>
	<td class="right"><?php echo $column_action; ?></td>
  </tr>
</thead> 
<tbody>
  <?php if ($reminders) { ?>
  <?php foreach ($reminders as $reminder) { ?>
  <tr>
	<td class="left"><?php echo strtoupper($reminder['firstname'] . ' ' . $reminder['lastname']); ?><br /><?php echo $reminder['email']; ?></td>
	<td class="left">
		<?php if ($reminder['cart_products']) { ?>
		<table style="width:100%;">
		<?php foreach($reminder['cart_products'] as $product) { ?>
			<tr>
				<td width="1"><img src="<?php echo $product['image']; ?>" /></td>
				<td><?php echo $product['name']; ?>
				<?php foreach ($product['options'] as $option) { ?>
				<br />
				&nbsp;<small> - <?php echo $option['name']; ?>: <?php echo $option['option_value']; ?></small>
				<?php } ?>
				</td>
				<td width="35"> x <?php echo $product['quantity']; ?></td>	
			</tr>
		<?php } ?>
		</table>
		<?php } ?>
	</td>
	<td class="left"><?php echo $reminder['last_action']; ?></td>
	<td class="center">
		<a onclick="reminderShow('preview', <?php echo $reminder['customer_id']; ?>);" title="<?php echo $button_preview; ?>"><img src="view/image/abandoned_cart_reminder/preview.png"></a>
		<a onclick="reminderShow('send', <?php echo $reminder['customer_id']; ?>);" title="<?php echo $button_send; ?>"><img src="view/image/abandoned_cart_reminder/send.png"></a>
		
	</td>
  </tr>
  <?php } ?>
  <?php } else { ?>
  <tr>
	<td class="center" colspan="5"><?php echo $text_no_results; ?></td>
  </tr>
  <?php } ?>
</tbody>
</table>