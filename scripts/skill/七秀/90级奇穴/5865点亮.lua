---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/90����Ѩ/5865����.lua
-- ����ʱ��:	2013/5/9 16:13:00
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	if player.GetBuff(1383, 2) then
		--player.DelBuff(5865,1)
		player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
	else
		for i = 1, 7 do
			if player.GetBuff(409, i) then
				local	nBuff = player.GetBuff(409, i)
				stackNum = nBuff.nStackNum
				if stackNum >= 6  then
					--player.DelBuff(5865,1)
					player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
				end
				--if stackNum >= 4  then			
					--player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
				--end
			end
			if player.GetBuff(409, i + 7) then
				local	nBuff = player.GetBuff(409, i + 7)
				stackNum = nBuff.nStackNum
				if stackNum >= 6  then
					--player.DelBuff(5865,1)
					player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
				end
				--if stackNum >= 4  then			
					--player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
				--end
			end
			if player.GetBuff(409, i + 14) then
				local	nBuff = player.GetBuff(409, i + 14)
				stackNum = nBuff.nStackNum
				if stackNum >= 6  then
					--player.DelBuff(5865,1)
					player.AddBuff(dwCharacterID, player.nLevel, 5865, 1, 1)
				end
				--if stackNum >= 4  then			
					--player.AddBuff(dwCharacterID, player.nLevel, 5866, 1, 1)
				--end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com