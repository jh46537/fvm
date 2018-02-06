#include "fvm.h"


int main(int argc, char** argv) {
    FPGA fpga{};
    FPGA_slot slot0 = fpga.getSlot(0);

    // Write command
    Command wr_cmd(Command::WRITE, Command::PA, -1, 1 << LG_SLOT_SIZE, true);
    slot0.writePCIE(0, wr_cmd.data());
    slot0.send(sizeof(PCIEData));

    // Write data
    std::cout << "write data" << std::endl;
    for (DWORD i = 0; i < SLOT_SIZE / sizeof(DWORD); ++i) {
        int data = rand();
        slot0.write(i, data);
        std::cout << data << std::endl;
    }
    slot0.send(SLOT_SIZE);

    // Read command
    Command rd_cmd(Command::READ, Command::PA, -1, 1 << LG_SLOT_SIZE, true);
    slot0.writePCIE(0, rd_cmd.data());
    slot0.send(sizeof(PCIEData));

    // Read data
    std::cout << "read data" << std::endl;
    DWORD size = slot0.receive();
    for (DWORD i = 0; i < size; ++i) {
        std::cout << slot0.read(i) << std::endl;
    }
}
