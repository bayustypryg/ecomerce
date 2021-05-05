<main role="main" class="container">
    <?php $this->load->view('layouts/_alert'); ?>
	<div class="row">
		<div class="col-md-3">
			<?php $this->load->view('layouts/_menu'); ?>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-5">
					<div class="card">
                        <div class="card-header bg-dark text-light text-center">
                            <h5>Photo Profile</h5>
                        </div>
						<div class="card-body text-center">
							<img src="<?= $content->image ? base_url("/images/user/$content->image") : base_url("/images/user/default-users.png") ?>" alt="" width="300px">
						</div>
					</div>
				</div>
				<div class="col-md-7">
					<div class="card">
                        <div class="card-header bg-dark text-light text-center">
                            <h5>Data Profile</h5>
                        </div>
						<div class="card-body">
							<p>Nama: <?= $content->name ?> </p>
							<p>E-mail: <?= $content->email ?> </p>
							<a href="<?= base_url("/profile/update/$content->id") ?>" class="btn btn-dark">Edit Profile</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
