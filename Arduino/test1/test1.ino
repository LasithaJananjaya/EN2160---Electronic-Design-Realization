#include <Wire.h>
#include <Adafruit_GFX.h>
#include <Adafruit_SSD1306.h>
#include <avr/pgmspace.h>

#define PB_OK 2
#define PB_NEXT 3
#define PB_CANCEL 4
#define TX 5
#define RX 6
#define BUZZER 10

#define ButtonDebounceTime 200

int POT = analogRead(A0);
//int DATA = analogRead(A1);

// Set up variables
int analogPin1 = A1;
int analogPin2 = A2;
const int threshold = 500;
String morseCode = "";
String message = "";
unsigned long startTime = 0;
const int ditValue = 100;
const int dahValue = 300;
const int symbolSpace = 100;
const int letterSpace = 300;
const int wordSpace = 700;
const int stop = 2000;

///////////////////////////////////////////////////////////////////

char Letters[27] = "ABCDEFGHIJKLMNOPQRSTUVWXYZ_";

// Array holding all Morse code letter dot dash combinations

const PROGMEM char MorseCode[26][6] = {
  {'.', '-', 'x', 'x', 'x', 'A'},
  {'-', '.', '.', '.', 'x', 'B'},
  {'-', '.', '-', '.', 'x', 'C'},
  {'-', '.', '.', 'x', 'x', 'D'},
  {'.', 'x', 'x', 'x', 'x', 'E'},
  {'.', '.', '-', '.', 'x', 'F'},
  {'-', '-', '.', 'x', 'x', 'G'},
  {'.', '.', '.', '.', 'x', 'H'},
  {'.', '.', 'x', 'x', 'x', 'I'},
  {'.', '-', '-', '-', 'x', 'J'},
  {'-', '.', '-', 'x', 'x', 'K'},
  {'.', '-', '.', '.', 'x', 'L'},
  {'-', '-', 'x', 'x', 'x', 'M'},
  {'-', '.', 'x', 'x', 'x', 'N'},
  {'-', '-', '-', 'x', 'x', 'O'},
  {'.', '-', '-', '.', 'x', 'P'},
  {'-', '-', '.', '-', 'x', 'Q'},
  {'.', '-', '.', 'x', 'x', 'R'},
  {'.', '.', '.', 'x', 'x', 'S'},
  {'-', 'x', 'x', 'x', 'x', 'T'},
  {'.', '.', '-', 'x', 'x', 'U'},
  {'.', '.', '.', '-', 'x', 'V'},
  {'.', '-', '-', '.', 'x', 'X'},
  {'-', '-', '.', '-', 'x', 'Y'},
  {'.', '-', '-', 'x', 'x', 'W'},
  {'.', '-', '.', 'x', 'x', 'Z'},
};

/*
  const PROGMEM String Morse_Code[26][2] = {
  {".", "E"},
  {"-", "T"},
  {"..", "I"},
  {".-", "A"},
  {"-.", "N"},
  {"--", "M"},
  {"...", "S"},
  {"..-", "U"},
  {".-.", "R"},
  {".--", "W"},
  {"-..", "D"},
  {"-.-", "K"},
  {"--.", "G"},
  {"---", "O"},
  {"....", "H"},
  {"...", "V"},
  {"..-.", "F"},
  {".-..", "L"},
  {".--.", "P"},
  {".---", "J"},
  {"-...", "B"},
  {".--", "X"},
  {"-.-.", "C"},
  {"--.", "Y"},
  {".-", "Z"},
  {"--.-", "Q"},
  };
*/


// Variables capturing current and newly calculated position on the letter board (Values 0-26)
int New_Position = 0;
int Old_Position = 0;

// Variable capturing Potentimeter read (Values 0 1023)
int Pot_read = 0;

// Variable used for calculating moving average of potentiometer reading to stabilise the input
int Count_For_Moving_Average = 0;

// String variable holding the text to transmit
String To_Transmit = "";

// Length of the text to transmit
int To_Transmit_Length = 0;

////////////////////////////////////////////////////////////////

#define SCREEN_WIDTH 128
#define SCREEN_HEIGHT 64
#define OLED_RESET -1
#define SCREEN_ADDRESS 0x3c

Adafruit_SSD1306 display(SCREEN_WIDTH, SCREEN_HEIGHT, &Wire, OLED_RESET);

String modes[] = {"ENCODE", "DECODE"};
int mode = 0;

void setup() {
  pinMode(BUZZER, OUTPUT);
  pinMode(PB_OK, INPUT);
  pinMode(PB_NEXT, INPUT);
  pinMode(PB_CANCEL, INPUT);
  pinMode(RX, OUTPUT);
  pinMode(TX, OUTPUT);

  //int POT = analogRead(A0);

  // put your setup code here, to run once:
  Serial.begin(9600);

  //SSD1306_SWITCHCAPVCC = generate display voltage from 3.3V internally
  if (!display.begin(SSD1306_SWITCHCAPVCC, SCREEN_ADDRESS)) {
    Serial.println(F("SSD1306 allocation failed!"));
    for (;;);
  }

  //show the display buffer on the screen. You MUST call display() after
  // drawing commands to make them visible on screen!
  display.display();
  delay(1000);
}

void loop() {
  // put your main code here, to run repeatedly:
  display.clearDisplay();

  print_line("MORSE CODE", 4, 0, 2);
  print_line("ENCODER", 0, 16, 2);
  print_line("DECODER", 0, 32, 2);
  display.fillRect(0, 16, 128, 16, SSD1306_INVERSE);
  display.display();
  delay(1000);
  select_mode();

}

void print_line(String text, int column, int row, int text_size) {

  display.setTextSize(text_size);
  display.setTextColor(SSD1306_WHITE);
  display.setCursor(column, row); //(column, row)
  display.println(text);

  display.display(); //call this function to display the message on the display
}

void dot() {
  digitalWrite(BUZZER, HIGH);
  delay(200);
  digitalWrite(BUZZER, LOW);
}

void dash() {
  digitalWrite(BUZZER, HIGH);
  delay(600);
  digitalWrite(BUZZER, LOW);
}

int wait_for_button_press() {
  while (true) {
    if (digitalRead(PB_OK) == LOW) {
      delay(ButtonDebounceTime);
      return PB_OK;
    }

    else if (digitalRead(PB_NEXT) == LOW) {
      delay(ButtonDebounceTime);
      return PB_NEXT;
    }
  }
}

void select_mode() {
  while (digitalRead(PB_CANCEL) == HIGH) {
    int pressed = wait_for_button_press();
    if (pressed == PB_NEXT) {
      //delay(200);
      mode += 1;
      mode %= 2;
      display.fillRect(0, 16, 128, 32, SSD1306_INVERSE);
      display.display();

      //display.fillRect(x-coordinate, y-coordinate, width, height, SSD1306_INVERSE);
    }

    else if (pressed == PB_OK) {
      run_mode(mode);
    }
  }
}

void run_mode(int mode) {
  while (mode == 0 && (digitalRead(PB_CANCEL) == HIGH)) {
    display.clearDisplay();
    print_line("ENCODER", 24, 24, 2);
    delay(700);
    display.clearDisplay();
    display.fillRect(0, 0, 128, 15, SSD1306_INVERSE);
    for (int j = 0; j < 3; j++) {
      for (int i = 0; i < 9; i++) {
        display.setCursor(i * 12 + 2 * i + 1, j * 16 + 17);
        display.println(Letters[i + j * 9]);
        display.display();
      }
    }
    display.fillRect(0, 16, 12, 16, SSD1306_INVERSE);
    To_Transmit = "";
    To_Transmit_Length = 0;
    select_letter();
    delay(200);
  }

  while (mode == 1 && (digitalRead(PB_CANCEL) == HIGH)) {
    display.clearDisplay();
    print_line("DECODER", 24, 24, 2);
    delay(700);
    read_audio_level();
  }
}

//------------------------------------------ENCODER----------------------------------------------
int select_letter() {
  while (digitalRead(PB_CANCEL) == HIGH) {
    int no_of_cycles = 10;
    while (Count_For_Moving_Average <= no_of_cycles) {
      // Increase Count_For_Moving_Average 30 times before calcluating moving average
      Count_For_Moving_Average++;

      Pot_read = Pot_read + analogRead(POT);
      if (Count_For_Moving_Average == no_of_cycles) {
        // Calculate moving average for 30 potentiometer reads
        // Without calculating moving average reads are to volatile
        Pot_read = (int)Pot_read / no_of_cycles;


        // As potentiometer read was not stable around 0 and 1023 values
        // Here is the code to fix it and make sure that values 0 and 26 are properly mapped
        // Between values 101 and 899 the potentiometer read is mapped to the range 0,26
        // New_Position is the new position calculated on the letter board corresponding to
        //potentiometer read

        if (Pot_read < 100 or Pot_read == 100) {
          New_Position = 0;
        }
        else if (Pot_read > 100 or Pot_read < 900) {
          New_Position = map(Pot_read, 101, 899, 0, 26);
        }
        if (Pot_read > 900 or Pot_read == 900) {
          New_Position = 26;
        }

        // If new position differes fro the previous one
        // remove highlight from the old one and Highlight a new one
        // New position becomes also the current position now
        if (Old_Position != New_Position) {
          Highlight_letter (New_Position, Old_Position);
          Old_Position = New_Position;
        }

        if (digitalRead(PB_NEXT) == LOW) {
          To_Transmit = To_Transmit + Letters[New_Position];
          To_Transmit_Length++;
          display.setCursor(3, 0);
          display.setTextColor(BLACK);
          display.fillRect(0, 0, 128, 15, SSD1306_WHITE);
          display.println(To_Transmit);
          display.display();
          delay(100);
        }
      }
    }

    if (digitalRead(PB_OK) == LOW) {
      Serial.print(F("To transmit - "));
      Serial.println(To_Transmit);
      char char_to_transmit[To_Transmit.length()];
      strcpy(char_to_transmit, To_Transmit.c_str());
      for (int i = 0; i < To_Transmit_Length; i++ ) {
        //Serial.print("Letter to be played - ");
        //Serial.println(F("Entering play letter to transmitt a new letter"));
        Play_Letter(char_to_transmit[i]);
      }
      To_Transmit = "";
      To_Transmit_Length = 0;
      Serial.print("To transmit length - ");
      Serial.println(To_Transmit_Length);
      break;
    }

    // reset Count_For_Moving_Average and Pot_read to start calculating the new moving average
    Count_For_Moving_Average = 0;
    Pot_read = 0;
  }
}

void Highlight_letter(int New_Pos, int Old_Pos) {
  // When position changes from Old_Pos to New_Pos
  // Draw the inverse rect in the Old_pos to deactivate  the highlight in the old spot
  // Draw the inverse rect to Highlite the new spot
  int X_pos;
  int Y_pos;

  // Calculate X and Y coordinates of the New_Pos on the letter board
  X_pos = New_Pos - ((int)New_Pos / 9) * 9;
  Y_pos = (int)New_Pos / 9;

  // Displaying Inverse rect
  display.fillRect(X_pos * 12 + 2 * X_pos, Y_pos * 16 + 16, 12, 16, SSD1306_INVERSE);

  // Calculate X and Y coordinates of the Old_Pos on the letter board
  X_pos = Old_Pos - ((int)Old_Pos / 9) * 9;
  Y_pos = (int)Old_Pos / 9;
  // Displaying Inverse rect
  display.fillRect(X_pos * 12 + 2 * X_pos, Y_pos * 16 + 16, 12, 16, SSD1306_INVERSE);
  display.display();
}

// Play/Display Morse code representation of the letter
void Play_Letter (char Letter) {

  // searching in MorseCode array for the corresponding letter
  if (Letter == '_') {
    delay(1000);
  }

  else {
    for (int j = 0; j < 26; j++) {
      //Serial.print(j);
      // Necessary casts and dereferencing.
      char c = pgm_read_byte(&(MorseCode[j][5]));
      //Serial.print(c);

      if (c == Letter) {
        //Serial.println("Matched!");
        // if the right letter is detected run Play_Dot_Dash for . or -

        for (int k = 0; k < 4; k++) {
          char c = pgm_read_byte(&(MorseCode[j][k]));
          if (c != 'x') {
            //Serial.print("J = ");
            //Serial.print(j);
            //Serial.print(" K = ");
            //Serial.print(k);
            //Serial.print("  ");
            //Serial.println(c);
            Play_Dot_Dash(c);
          }
        }
      }
    }
  }
}

// Playing/Displaying . or -

void Play_Dot_Dash(char sign) {
  if (sign == '.') {
    //digitalWrite(5, 100);
    tone(BUZZER, 3000, 200);
    delay(500);
  }
  if (sign == '-') {
    //digitalWrite(5, 100);
    tone(BUZZER, 3000, 500);
    delay(800);
  }
}

//----------------------------------------DECODER--------------------------------------
void read_audio_level() {
  while(true){
  display.clearDisplay();
  int value = analogRead(analogPin1);
  print_line(String(value),0,0,2);
  //print_line(String(analogRead(analogPin2)),0,16,2);
  if (value > 0){
    print_line("yes",0,16,2);
  }
  }

  /*
  while (digitalRead(PB_CANCEL) == HIGH) {
    display.clearDisplay();
    print_line("Receiving...", 0, 0, 2);
    bool exit = false;
    unsigned long duration;
    int audioLevel = analogRead(analogPin1);

    while (true) {
      int reading = analogRead(analogPin1);

      if (reading >= threshold) {
        startTime = millis();
        digitalWrite(RX, HIGH);
        while (reading >= threshold) {
          reading = analogRead(analogPin1);
        }
        duration = millis() - startTime;
        digitalWrite(RX, LOW);

        if ((ditValue - 50) <= duration <= (ditValue + 50)) {
          morseCode += ".";
        }
        else if ((dahValue - 50) <= duration <= (dahValue + 50)) {
          morseCode += "-";
        }
      }

      else if ((reading < threshold)) {
        startTime = millis();
        while (reading < threshold) {
          reading = analogRead(analogPin1);
          duration = millis() - startTime;
          if (duration > stop) {
            decodeMorse();
            display.clearDisplay();
            print_line("Complete", 0, 0, 2);
            print_line(message, 0, 16, 2);
            morseCode = "";
            message = "";
            exit = true;
            break;
          }
        }

        if ((symbolSpace - 50) <= duration <= (symbolSpace + 50)) {
          continue;
        }
        else if ((letterSpace - 50) <= duration <= (letterSpace + 50)) {
          decodeMorse();
        }
        else if ((wordSpace - 50) <= duration <= (wordSpace + 50)) {
          message += " ";
          display.clearDisplay();
          print_line(message, 0, 16, 2);
        }
      }

      if (exit) {
        break;
      }
    }
  } */
}


void decodeMorse() {
  /*
    for (int i = 0; i < 27; i++) {
    if (MorseCode[i][0] == morseCode) {
      message += MorseCode[i][1];
      display.clearDisplay();
      print_line(message, 0, 16, 2);
    }
    }
    morseCode = "";
  */
}