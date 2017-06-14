---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/�����Ժ/3��/Ӣ�ۺ���buff����.lua
-- ����ʱ��:	2015/9/26 15:37:48
-- �����û�:	WANGZEYU
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------

--ħ������Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function Apply(dwCharacterID)
	local Player = GetPlayer(dwCharacterID)
	if not Player then
		return
	end

	local scene = Player.GetScene()
	local Master = scene.GetNpcByNickName("Jiansheng")
	local AllPlayer = scene.GetAllPlayer()

	if Master then
		Master.CastSkillXYZ(13915, 1, Player.nX, Player.nY, Player.nZ)
		Master.PlaySfx(1152, Player.nX, Player.nY, Player.nZ + 500)

		for i = 1, #AllPlayer do
			local GPlayer = GetPlayer(AllPlayer[i])
			if GPlayer ~= Player and GPlayer.nMoveState ~= MOVE_STATE.ON_DEATH then
				if GetCharacterDistance(Player.dwID, GPlayer.dwID) < 320 then
					GPlayer.AddBuff(0, 99, 8817, 2)
					Master.AddBuff(0, 99, 8877, 2)
				end
			end
		end
	end
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com