---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_˫��ͤ/�ڳ�Ԫ��_�ػ�.lua
-- ����ʱ��:	2016/4/8 17:27:06
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	if npc.GetBuff(10604, 2) then
		if npc.GetBuff(10604, 2).nStackNum == 1 then
			npc.nCurrentLife = npc.nCurrentLife + 1600
		end

		if npc.GetBuff(10604, 2).nStackNum == 2 then
			npc.nCurrentLife = npc.nCurrentLife + 4800
		end

		if npc.GetBuff(10604, 2).nStackNum == 3 then
			npc.nCurrentLife = npc.nCurrentLife + 12800
		end

		if npc.GetBuff(10604, 2).nStackNum == 4 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end

		if npc.GetBuff(10604, 2).nStackNum == 5 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end

		if npc.GetBuff(10604, 2).nStackNum == 6 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end
		
		if npc.GetBuff(10604, 2).nStackNum == 7 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end
		
		if npc.GetBuff(10604, 2).nStackNum == 8 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end
		
		if npc.GetBuff(10604, 2).nStackNum == 9 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end
		
		if npc.GetBuff(10604, 2).nStackNum == 10 then
			npc.nCurrentLife = npc.nCurrentLife + 24000
		end
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com