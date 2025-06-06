#!/bin/bash


RVSON=r177

if [[ ! -f $RVSON.zip ]]; then
    curl -L -O https://github.com/mrdoob/three.js/archive/refs/tags/$RVSON.zip
fi

if [[ ! -d three.js-$RVSON ]]; then
    echo "Unzip now? Checked the contents before?"
    read
    echo "Really?"
    read
    unzip $RVSON.zip
fi

rm -fr www
mkdir -p www/build
mkdir -p www/examples/jsm
rsync -avP ./three.js-$RVSON/build/. www/build/.
rsync -avP ./three.js-$RVSON/examples/jsm/. www/examples/jsm/.
cp ~/webseiten/comparts/src/0228B003-95AF-4C95-8D84-6B1D4DB351A6/build.scad.stl www/model.stl
cat >www/index.html <<"EOF"
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>STL Viewer</title>
  <style>
    body { margin: 0; }
    canvas { width: 100%; height: 100% }
  </style>
</head>
<body>

<script type="importmap">
{
  "imports": {
    "three": "./build/three.module.js"
  }
}
</script>

<script type="module">
import * as THREE from './build/three.module.js';
import { STLLoader } from './examples/jsm/loaders/STLLoader.js';
import { OrbitControls } from './examples/jsm/controls/OrbitControls.js';

const scene = new THREE.Scene();
scene.background = new THREE.Color('white');

const camera = new THREE.PerspectiveCamera(75, window.innerWidth/window.innerHeight, 0.1, 1000);
const renderer = new THREE.WebGLRenderer();
renderer.setSize(window.innerWidth, window.innerHeight);
document.body.appendChild(renderer.domElement);

const controls = new OrbitControls(camera, renderer.domElement);
controls.update();

const light = new THREE.HemisphereLight(0xffffff, 0x444444);
scene.add(light);

const loader = new STLLoader();
loader.load('model.stl', function (geometry) {
    const material = new THREE.MeshStandardMaterial({ color: 0xefefef });
    const mesh = new THREE.Mesh(geometry, material);
    scene.add(mesh);
    geometry.center();
    geometry.computeVertexNormals();
    camera.position.set(0, 0, 100);
    controls.update();
});

function animate() {
    requestAnimationFrame(animate);
    renderer.render(scene, camera);
}
animate();
</script>

</body>
</html>

EOF
