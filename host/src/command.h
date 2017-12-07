#pragma once

// NOTE: this is dependent of platform-specific ordering, of course
struct PCIEData
{
    DWORD data[4] = {0};

    PCIEData() {}
    PCIEData(DWORD a, DWORD b, DWORD c, DWORD d) {
        data[3] = a;
        data[2] = b;
        data[1] = c;
        data[0] = d;
    }
    PCIEData(PCIEData const& other) {
        for (size_t i = 0; i < 4; ++i)
            data[i] = other.data[i];
    }
};

struct Command
{
    enum { PA, VA };
    enum { READ, WRITE };

    PCIEData cmd;

    Command() : cmd() {}
    Command(PCIEData data) : cmd(data) {}
    Command(DWORD rw, DWORD pva, DWORD high, DWORD low, bool isVA = false) : cmd() {
        setRW(rw);
        setRW(pva);
        setAddr(high, low, isVA);
    }

    void setRW(DWORD rw) {
        cmd.data[3] &= ~0x8000000;
        cmd.data[3] += (rw & 0x1) << 31;
    }
    DWORD getRW() const {
        return (cmd.data[3] & 0x8000000) >> 31;
    }

    void setPVA(DWORD pva) {
        cmd.data[3] &= ~0x4000000;
        cmd.data[3] += (pva & 0x1) << 30;
    }
    DWORD getPVA() const {
        return (cmd.data[3] & 0x4000000) >> 30;
    }

    void setAddr(DWORD high, DWORD low, bool isVA = false) {
        DWORD width = isVA ? VA_WIDTH : PA_WIDTH;
        DWORD top_mask = -1 << (width - 32);
        high &= ~top_mask;
        DWORD bottom_mask = -1 << LG_SLOT_SIZE;
        low &= bottom_mask;
        cmd.data[1] = high;
        cmd.data[0] = low;
    }
    void getAddr(DWORD& high, DWORD& low) const {
        high = cmd.data[1];
        low = cmd.data[0];
    }

    PCIEData& data() {
        return cmd;
    }

    friend std::ostream& operator<<(std::ostream& os, Command const& cmd);
};
std::ostream& operator<<(std::ostream& os, Command const& cmd) {
    DWORD addr_high, addr_low;
    cmd.getAddr(addr_high, addr_low);
    os << "["
        << "rw: " << cmd.getRW() << ", "
        << "pva: " << cmd.getPVA() << ", "
        << "addr: 0x"
        << std::hex << std::setw(8) << std::setfill('0') << addr_high
        << std::hex << std::setw(8) << std::setfill('0') << addr_low
        << std::dec
        << "]";
    return os;
}
