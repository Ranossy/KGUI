--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
		if not cPlayer then
			return
		end
		if cPlayer.nCurrentLife > cPlayer.nMaxLife * 0.5 then
			cPlayer.nCurrentLife = cPlayer.nMaxLife 
		else
			cPlayer.nCurrentLife = cPlayer.nCurrentLife + cPlayer.nMaxLife * 0.5
    end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com