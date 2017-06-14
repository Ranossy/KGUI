---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����й�_���±�Ժ/���±�Ժ_3��_��Ӻ�ɫ���.lua
-- ����ʱ��:	2015/6/2 11:16:46
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local npctarget = GetNpc(dwCharacterID)
	local scene
	if npctarget and npctarget.nMoveState ~= MOVE_STATE.ON_DEATH then
		scene = npctarget.GetScene()
		if scene.dwMapID == 221 then
			npctarget.AddBuff(0, 99, 8976, 1, 30)
		end

		if scene.dwMapID == 230 or scene.dwMapID == 233 then
			npctarget.AddBuff(0, 99, 8976, 2, 60)
		end

		if scene.dwMapID == 235 then
			npctarget.AddBuff(0, 99, 8976, 3, 30)
		end

		if scene.dwMapID == 237 then
			npctarget.AddBuff(0, 99, 8976, 4, 60)
		end
	end

	local playertarget = GetPlayer(dwCharacterID)
	if playertarget and playertarget.nMoveState ~= MOVE_STATE.ON_DEATH then
		scene = playertarget.GetScene()
		if scene.dwMapID == 221 then
			playertarget.AddBuff(0, 99, 8976, 1, 30)
		end

		if scene.dwMapID == 230 or scene.dwMapID == 233 then
			playertarget.AddBuff(0, 99, 8976, 2, 60)
		end

		if scene.dwMapID == 235 then
			playertarget.AddBuff(0, 99, 8976, 3, 30)
		end

		if scene.dwMapID == 237 then
			playertarget.AddBuff(0, 99, 8976, 4, 60)
		end
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com