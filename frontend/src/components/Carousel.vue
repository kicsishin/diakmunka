<template>
  <div id="carouselExample" class="carousel slide position-relative" data-bs-ride="carousel">
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img src="../pics/carousel1.jpg" class="d-block w-100" alt="..." />
      </div>
      <div class="carousel-item">
        <img src="../pics/carousel2.jfif" class="d-block w-100" alt="..." />
      </div>
      <div class="carousel-item">
        <img src="../pics/carousel3.png" class="d-block w-100" alt="..." />
      </div>
    </div>
    <button
      class="carousel-control-prev"
      type="button"
      data-bs-target="#carouselExample"
      data-bs-slide="prev"
    >
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button
      class="carousel-control-next"
      type="button"
      data-bs-target="#carouselExample"
      data-bs-slide="next"
    >
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>

    <div class="position-absolute top-50 start-50 translate-middle">
      <h2 class="my-fs-cim"><span class="p-2 ps-4 pe-4 my-bg-cim">Student Work</span> </h2>
    </div>

  </div>
</template>

<script>
export default {};
</script>
<style>
.my-bg-cim {
  background-color: rgba(255,255,255,0.3);
  border-radius: 10px;
}
.my-fs-cim {
  font-size: 5rem;
  font-weight: normal;
  font-family: sans-serif;
}
img{
  height: 300px;
  width: auto;
}

</style>