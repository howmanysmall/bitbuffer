local try = require("try")

local specs = {
    "bitbuffer",
    "bit",
    "byte",
    "unsigned",
    "signed",
    "float",
    "string",
    "terminatedstring",
    "setlengthstring",
    "field",

    "uint8",
    "uint16",
    "uint32",

    "int8",
    "int16",
    "int32",

    "float16",
    "float32",
    "float64",
}

-- local trySpec = require("spec/try")
-- if not trySpec(try) then
--     print("trySpec failed")
--     return
-- end

for _, v in ipairs(specs) do
    local test = require("spec/"..v)
    test(try.new)
end

local finalPass, finalFail, finalDisabled = try.reportFinal()

print(string.format("FINAL COUNT: %i PASSED, %s FAILED, %s DISABLED", finalPass, finalFail, finalDisabled))

if finalFail ~= 0 then
    os.exit(false)
end
