------------------------------------------------
-- ������   :  �ź�	
-- ����ʱ��	:  2013-2-21
-- Ч����ע	:  Ĭ�ϵļ��ܽű�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------
Include("scripts/Include/ClearCoolID.lh")
--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end
	local nBuff = player.GetBuff(5273, 1)
	if not nBuff then
		return
	end
	local nNum0 = Random(100000)
	local nNum = nBuff.nStackNum
	if nNum == 1 then
		if nNum0 < 10001 then
			for i = 1, #tCoolID do	--���CD
				if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�   
					player.ClearCDTime(tCoolID[i])
				end
			end
		end
	elseif nNum == 2 then
		if nNum0 < 20001 then
			for i = 1, #tCoolID do	--���CD
				if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�   
					player.ClearCDTime(tCoolID[i])
				end
			end
		end
	elseif nNum == 3 then
		if nNum0 < 30001 then
			for i = 1, #tCoolID do	--���CD
				if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�   
					player.ClearCDTime(tCoolID[i])
				end
			end
		end
	elseif nNum == 4 then
		if nNum0 < 40001 then
			for i = 1, #tCoolID do	--���CD
				if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�   
					player.ClearCDTime(tCoolID[i])
				end
			end
		end
	elseif nNum == 5 then
		if nNum0 < 50001 then
			for i = 1, #tCoolID do	--���CD
				if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�   
					player.ClearCDTime(tCoolID[i])
				end
			end
		end
	elseif nNum == 6 then
		if nNum0 < 60001 then
			for i = 1, #tCoolID do	--���CD
				if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�   
					player.ClearCDTime(tCoolID[i])
				end
			end
		end
	elseif nNum == 7 then
		if nNum0 < 70001 then
			for i = 1, #tCoolID do	--���CD
				if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�   
					player.ClearCDTime(tCoolID[i])
				end
			end
		end
	elseif nNum == 8 then
		if nNum0 < 80001 then
			for i = 1, #tCoolID do	--���CD
				if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�   
					player.ClearCDTime(tCoolID[i])
				end
			end
		end
	elseif nNum == 9 then
		if nNum0 < 90001 then
			for i = 1, #tCoolID do	--���CD
				if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�   
					player.ClearCDTime(tCoolID[i])
				end
			end
		end
	elseif nNum == 10 then
		for i = 1, #tCoolID do	--���CD
			if tCoolID[i] ~= 152 and tCoolID[i] ~= 153 and tCoolID[i] ~= 155 and tCoolID[i] ~= 154 and tCoolID[i] ~= 157 and tCoolID[i] ~= 156 and tCoolID[i] ~= 452 and tCoolID[i] ~= 493 and tCoolID[i] ~= 565 then  --�������ڹ��л�   
				player.ClearCDTime(tCoolID[i])
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com