<?php
    if ($status == 'waiting') {
        $badge_status   = 'badge-warning';
        $status         = 'Menunggu Pembayaran';
    }

    if ($status == 'paid') {
        $badge_status   = 'badge-info';
        $status         = 'Pesanan Telah Dibayar';
    }
    
    if ($status == 'packaging') {
        $badge_status   = 'badge-primary';
        $status         = 'Produk Sedang Dikemas';
    }

    if ($status == 'delivered') {
        $badge_status   = 'badge-success';
        $status         = 'Produk Telah Dikirim';
    }

    if ($status == 'cancel') {
        $badge_status   = 'badge-danger';
        $status         = 'Pesanan Dibatalkan';
    }
?>

<?php if($status): ?>
    <span class="badge badge-pill <?= $badge_status ?> text-light"><?= $status ?></span>
<?php endif ?>