---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_���±�Ժ/���±�Ժ_2��_ʱ��ӹ���ĸbuff.lua
-- ����ʱ��:	2015/5/22 15:37:01
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npc = GetNpc(dwCharacterID)
	if not npc then
		return
	end

	local scene = npc.GetScene()
	if scene.dwMapID == 230 or scene.dwMapID == 233 then---25�˺Ͱ�Ứ��
		if npc.GetBuff(8919, 2) then
			if npc.GetBuff(8919, 2).nLeftActiveCount == 50 then
				npc.AddBuff(0, 99, 8920, 2)
			end
	
			if npc.GetBuff(8919, 2).nLeftActiveCount == 40 then
				npc.AddBuff(0, 99, 8920, 2)
			end
	
			if npc.GetBuff(8919, 2).nLeftActiveCount == 30 then
				npc.AddBuff(0, 99, 8920, 2)
			end
	
			if npc.GetBuff(8919, 2).nLeftActiveCount == 20 then
				npc.AddBuff(0, 99, 8920, 2)
			end
	
			if npc.GetBuff(8919, 2).nLeftActiveCount == 10 then
				npc.AddBuff(0, 99, 8920, 2)
			end
	
			if npc.GetBuff(8919, 2).nLeftActiveCount == 1 then
				npc.AddBuff(0, 99, 8920, 2)
			end
		end
	end

	if scene.dwMapID == 235 then---10����ս
		if npc.GetBuff(8919, 3) then
			if npc.GetBuff(8919, 3).nLeftActiveCount == 50 then
				npc.AddBuff(0, 99, 8920, 3)
			end
	
			if npc.GetBuff(8919, 3).nLeftActiveCount == 40 then
				npc.AddBuff(0, 99, 8920, 3)
			end
	
			if npc.GetBuff(8919, 3).nLeftActiveCount == 30 then
				npc.AddBuff(0, 99, 8920, 3)
			end
	
			if npc.GetBuff(8919, 3).nLeftActiveCount == 20 then
				npc.AddBuff(0, 99, 8920, 3)
			end
	
			if npc.GetBuff(8919, 3).nLeftActiveCount == 10 then
				npc.AddBuff(0, 99, 8920, 3)
			end
	
			if npc.GetBuff(8919, 3).nLeftActiveCount == 1 then
				npc.AddBuff(0, 99, 8920, 3)
			end
		end
	end

	if scene.dwMapID == 237 then---10����ս
		if npc.GetBuff(8919, 4) then
			if npc.GetBuff(8919, 4).nLeftActiveCount == 50 then
				npc.AddBuff(0, 99, 8920, 4)
			end
	
			if npc.GetBuff(8919, 4).nLeftActiveCount == 40 then
				npc.AddBuff(0, 99, 8920, 4)
			end
	
			if npc.GetBuff(8919, 4).nLeftActiveCount == 30 then
				npc.AddBuff(0, 99, 8920, 4)
			end
	
			if npc.GetBuff(8919, 4).nLeftActiveCount == 20 then
				npc.AddBuff(0, 99, 8920, 4)
			end
	
			if npc.GetBuff(8919, 4).nLeftActiveCount == 10 then
				npc.AddBuff(0, 99, 8920, 4)
			end
	
			if npc.GetBuff(8919, 4).nLeftActiveCount == 1 then
				npc.AddBuff(0, 99, 8920, 4)
			end
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com