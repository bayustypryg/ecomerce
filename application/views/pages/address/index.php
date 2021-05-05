<main role="main" class="container">
    <?php $this->load->view('layouts/_alert'); ?>
	<div class="row">
		<div class="col-md-3">
			<?php $this->load->view('layouts/_menu'); ?>
		</div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-12">
					<div class="card">
                        <div class="card-header bg-dark text-light text-center">
                            <h5><?=$title?></h5>
                        </div>
						<div class="card-body text-center">
						<a href="<?= base_url()?>address/create" class="btn btn-dark float-right mb-3">Create</a>
							<div class="">
								<table class="table table-bordered">
									<thead>
										<tr>
											<th style="width:70%">Address</th>
											<th>Action</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td>Lorem ipsum dolor sit amet consectetur, adipisicing elit. Ipsa debitis ab amet ut libero tempora dolore voluptatibus doloremque. Necessitatibus, pariatur?</td>
											<td>
												<button class="btn btn-warning">Edit</button>
												<button class="btn btn-danger">Delete</button>
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div>
</main>
