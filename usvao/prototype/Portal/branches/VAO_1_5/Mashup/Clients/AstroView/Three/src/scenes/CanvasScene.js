/**
 * @author mr.doob / http://mrdoob.com/
 */

THREE.CanvasScene = function () {

	THREE.Object3D.call( this );

	this.fog = null;
	this.overrideMaterial = null;

	this.matrixAutoUpdate = false;

	this.__objects = [];
	this.__lights = [];
};

THREE.CanvasScene.prototype = new THREE.Object3D();
THREE.CanvasScene.prototype.constructor = THREE.CanvasScene;

THREE.CanvasScene.prototype.__addObject = function ( object ) {

	if ( object instanceof THREE.Light ) {

		if ( this.__lights.indexOf( object ) === - 1 ) {

			this.__lights.push( object );

		}

	} else if ( !( object instanceof THREE.Camera || object instanceof THREE.Bone ) ) {

		if ( this.__objects.indexOf( object ) === - 1 ) {

			this.__objects.push( object );

		}

	}

	for ( var c = 0; c < object.children.length; c ++ ) {

		this.__addObject( object.children[ c ] );

	}

};

THREE.CanvasScene.prototype.__removeObject = function ( object ) {

	if ( object instanceof THREE.Light ) {

		var i = this.__lights.indexOf( object );

		if ( i !== -1 ) {

			this.__lights.splice( i, 1 );

		}

	} else if ( !( object instanceof THREE.Camera || object instanceof THREE.Bone ) ) {

		var i = this.__objects.indexOf( object );

		if( i !== -1 ) {

			this.__objects.splice( i, 1 );

		}

	}

	for ( var c = 0; c < object.children.length; c ++ ) {

		this.__removeObject( object.children[ c ] );

	}

};
