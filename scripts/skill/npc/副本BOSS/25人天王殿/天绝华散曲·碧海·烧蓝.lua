--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local cPlayer = GetPlayer(dwCharacterID)
	local scene = cPlayer.GetScene()
	if not cPlayer then
		return
	end
	if scene.dwMapID == 131 then
		    if cPlayer.nCurrentMana >= cPlayer.nMaxMana * 0.03 then
			cPlayer.nCurrentMana = cPlayer.nCurrentMana - cPlayer.nMaxMana * 0.03
	        end
	elseif scene.dwMapID == 148 then
		    if cPlayer.nCurrentMana >= cPlayer.nMaxMana * 0.05 then
			cPlayer.nCurrentMana = cPlayer.nCurrentMana - cPlayer.nMaxMana * 0.05
	        end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com