#include <iostream>
#include <cstdlib>
#include <windows.h>
#include <thread>
#include <chrono>
#include <atomic>

// Function declarations
void SetConsoleTextColor(int text_color, int background_color);
void UpdateArchive();
void EncryptArchive();
void SaveSSDArchive();
void SaveSSDVault();
void executeBatch(const char *batch);

using namespace std;

int main()
{
    // Displaying ASCII art header
    std::cout << "                                        *                                 \n"
              "   (                 )                (  `                  )             \n"
              " ( )\\     )       ( /(    (           )\\))(      )       ( /(    (   (    \n"
              " )((_) ( /(   (   )\\())  ))\\  `  )   ((_)()\\  ( /(   (   )\\())  ))\\  )(   \n"
              "((_)_  )(_))  )\\ ((_)\\  /((_) /(/(   (_()((_) )(_))  )\\ ((_)\\  /((_)(()\\  \n"
              " | _ )((_)_  ((_)| |(_)(_))( ((_)_\\  |  \\/  |((_)_  ((_)| |(_)(_))   ((_) \n"
              " | _ \\/ _` |/ _| | / / | || || '_ \\) | |\\/| |/ _` |/ _| | / / / -_) | '_| \n"
              " |___/\\__,_|\\__| |_\\_\\  \\_,_|| .__/  |_|  |_|\\__,_|\\__| |_\\_\\ \\___| |_|   \n"
              "                             |_|                                          \n"
              << endl;

    // Execute tasks
    UpdateArchive();
    EncryptArchive();
    SaveSSDArchive();
    SaveSSDVault();
    return 0;
}

// Function to set console text color
void SetConsoleTextColor(int text_color, int background_color)
{
    HANDLE console_handle = GetStdHandle(STD_OUTPUT_HANDLE);
    SetConsoleTextAttribute(console_handle, background_color * 16 + text_color);
}

// Function to update archive
void UpdateArchive()
{
    SetConsoleTextColor(5, 0);
    cout << "\t\t\t Saving the archive to SSD" << endl << endl;
    SetConsoleTextColor(15, 0);
    system("update_archive.bat");
    SetConsoleTextColor(10, 0);
    cout << endl << "\t\t\t\t\t\t\t\t\t\t\t\t Archive saved" << endl << endl;
    SetConsoleTextColor(15, 0);
}

// Function to encrypt archive
void EncryptArchive()
{
    SetConsoleTextColor(5, 0);
    cout << "\t\t\t Encrypting the archive" << endl << endl;
    SetConsoleTextColor(15, 0);
    executeBatch("encrypt.bat");
    SetConsoleTextColor(10, 0);
    cout << endl << "\t\t\t\t\t\t\t\t\t\t\t\t Archive encrypted" << endl << endl;
    SetConsoleTextColor(15, 0);
}

// Function to save archive to SSD
void SaveSSDArchive()
{
    SetConsoleTextColor(5, 0);
    cout << "\t\t\t Saving archive to SSD (E:)" << endl << endl;
    SetConsoleTextColor(15, 0);
    executeBatch("save_ssd_archive.bat");
    SetConsoleTextColor(10, 0);
    cout << endl << "\t\t\t\t\t\t\t\t\t\t\t\t Archive saved to SSD" << endl << endl;
    SetConsoleTextColor(15, 0);
}

// Function to save vault to SSD
void SaveSSDVault()
{
    SetConsoleTextColor(5, 0);
    cout << "\t\t\t Saving vault to SSD (E:)" << endl << endl;
    SetConsoleTextColor(15, 0);
    executeBatch("save_ssd_vault.bat");
    SetConsoleTextColor(10, 0);
    cout << endl << "\t\t\t\t\t\t\t\t\t\t\t\t Vault saved to SSD" << endl << endl;
    SetConsoleTextColor(15, 0);
}

// Function to execute batch command
void executeBatch(const char *batch)
{
    system(batch);
    std::cout << "Command completed." << std::endl;
}
