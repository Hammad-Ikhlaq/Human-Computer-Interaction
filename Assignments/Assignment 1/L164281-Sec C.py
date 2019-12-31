from tkinter import *
import matplotlib.pyplot as plt
from scipy.io import wavfile as wav
from scipy.fftpack import fft
import numpy as np
import wave
import contextlib

root = Tk()

def RecordOrUpload():
    rate, data = wav.read('F:/l.wav')
    plt.plot(data)
    amp=25000
    plt.axis([0, 500000, -30000, 30000])
    plt.show()

def PlotFFT():
    rate, data = wav.read('F:/l.wav')
    fft_out = fft(data)
    plt.plot(data, np.abs(fft_out))
    plt.axis([0, 35000, 0, 150000])
    plt.show()

rightFrame=Frame(root)
rightFrame.pack(side=RIGHT)

leftFrame=Frame(root)
leftFrame.pack(side=LEFT)

InsideFrame=Frame(leftFrame)
InsideFrame.pack(side=BOTTOM)

AudioSignallabel=Label(leftFrame,text="Audio Signal")
FFTlabel=Label(rightFrame,text="Fast Fourier Transform")
Durationlabel=Label(InsideFrame,text="Duration")

RecordButton=Button(InsideFrame,text="Record/Upload",command=RecordOrUpload)
FFTButton=Button(rightFrame,text="Plot FFT",command=PlotFFT)

AudioSignallabel.pack(side=TOP)
RecordButton.pack(side=LEFT)

FFTlabel.pack(side=TOP)
FFTButton.pack(side=TOP)

Durationlabel.pack(side=LEFT)

fname = 'F:/l.wav'
with contextlib.closing(wave.open(fname,'r')) as f:
    frames = f.getnframes()
    rate = f.getframerate()
    duration = frames / float(rate)

min=duration/60
sec=duration%60

DurationTextfield=Label(InsideFrame,text="{}{}{}".format(int(min),":",int(sec)))
DurationTextfield.pack(side=LEFT)
root.mainloop()