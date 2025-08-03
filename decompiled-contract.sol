contract DECOMPILED {

    function totalSupply() public view virtual override returns (uint256) {
    return _totalSupply;
  }

    function DOMAIN_SEPARATOR() external view returns (bytes32) {
        return _domainSeparatorV4();
    }

    function transferFrom(address from, address to, uint256 amount) public virtual override returns (bool) {
        address spender = _msgSender();
        _spendAllowance(from, spender, amount);
        _transfer(from, to, amount);
        return true;
    }

    function decreaseAllowance(address spender, uint256 subtractedValue) public virtual returns (bool) {
        address owner = _msgSender();
        uint256 currentAllowance = allowance(owner, spender);
        require(currentAllowance >= subtractedValue, "ERC20: decreased allowance below zero");
        unchecked {
            _approve(owner, spender, currentAllowance - subtractedValue);
        }
        return true;
    }

    function symbol() public view virtual override returns (string memory) {
        return _symbol;
    }

    function nonces(address owner) public view virtual override returns (uint256) {
        return _nonces[owner].current();
    }

    function transfer(address recipient, uint256 amount) public virtual override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    function balanceOf(address account) public view virtual override returns (uint256) {
        return _balances[account];
    }

    function withdrawFromPool(address _user, uint256 _amount) external returns (bool) {
        _withdraw(msg.sender, _user, _amount);
        return true;
    }

    function increaseAllowance(address spender, uint256 addedValue) public virtual returns (bool) {
        address owner = _msgSender();
        _approve(owner, spender, allowance(owner, spender) + addedValue);
        return true;
    }

    function allowance(address owner, address spender) public view virtual override returns (uint256) {
        return _allowances[owner][spender];
    }

    function eip712Domain() external view returns (string memory) {
        require(
            chainId != 0 && eip712Version != 0,
            "EIP712: Uninitialized"
        );
        return string(abi.encodePacked(
            "\x19\x01",
            keccak256(abi.encodePacked(
                "\x00",
                keccak256(abi.encodePacked(
                    "\x09EIP712",
                    keccak256(abi.encodePacked(
                        chainId,
                        address(this)
                    )),
                    keccak256(abi.encodePacked(
                        eip712Version
                    ))
                )),
                block.chainid,
                address(this),
                0
            ))
        ));
    }

    function decimals() public view virtual override returns (uint8) {
        return 18;
    }

    function blockHashAmphithyronVersify(uint256 _blockHash) public view returns (bytes32) {
        return blockHashAmphithyron(_blockHash);
    }

    function getBaseURI() public view returns (string memory) {
        return baseURI;
    }

    function initialize(address _owner) public initializer {
        __ERC20_init("Beefy", "BIFI");
        __ERC20Burnable_init("Beefy");
        _mint(_owner, 100_000_000 * 1e18);
    }

}