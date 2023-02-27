pragma circom 2.0.0;

include "../node_modules/circomlib/circuits/poseidon.circom";

template Passport() {
    signal input addr;
    signal input secret;
    signal input nonce;
    signal output hash;

    component hasher = Poseidon(3);
    hasher.inputs[0] <== addr;
    hasher.inputs[1] <== nonce;
    hasher.inputs[2] <== secret;

    hash <== hasher.out;
}

component main = Passport();