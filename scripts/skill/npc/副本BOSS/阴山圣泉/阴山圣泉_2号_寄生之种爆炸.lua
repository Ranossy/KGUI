---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/��ɽʥȪ/��ɽʥȪ_2��_����֮�ֱ�ը.lua
-- ����ʱ��:	2015/3/17 14:46:51
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if not player then
		return
	end

	local scene = player.GetScene()
	if not scene then
		return
	end

	local molei = scene.GetNpcByNickName("molei")
	if molei then
		if scene.dwMapID == 204 then
			molei.CastSkill(13792, 1, TARGET.PLAYER, dwCharacterID)
		elseif scene.dwMapID == 227 then
			molei.CastSkill(13792, 2, TARGET.PLAYER, dwCharacterID)
		end
	end
	player.PlaySfx(1121, player.nX, player.nY, player.nZ)
end

--ħ�����Է�Ӧ��ʱ��ִ�к���,dwCharacterID��ħ���������õ�Ŀ��ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com