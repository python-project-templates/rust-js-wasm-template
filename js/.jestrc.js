export default {
  bail: 5,
  clearMocks: true,
  coverageDirectory: "coverage",
  coverageProvider: "v8",
  moduleNameMapper: {
    "\\.(css|less|sass|scss)$": "<rootDir>/tests/styleMock.js",
    "\\.(jpg|jpeg|png|gif|eot|otf|webp|svg|ttf|woff|woff2|mp4|webm|wav|mp3|m4a|aac|oga)$": "<rootDir>/tests/fileMock.js",
  },
  slowTestThreshold: 20,
  reporters: [ "default", "jest-junit" ],
  testEnvironment: "node",
  testMatch: ["<rootDir>/tests/**/?(*.)+(spec|test).[tj]s?(x)"],
  transform: {},
  verbose: true,
};
