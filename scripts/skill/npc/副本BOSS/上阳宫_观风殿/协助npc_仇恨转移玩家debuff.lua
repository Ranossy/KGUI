---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/������_�۷��/Э��npc_���ת�����debuff.lua
-- ����ʱ��:	2016/8/9 14:59:44
-- �����û�:	zhangdongen
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------
 function OnRemove(nCharacterID, BuffID, nBuffLevel, nLeftFrame, nCustomValue)
 	local player = GetPlayer(nCharacterID)
	local scene = player.GetScene()
	if not scene then
		return
	end
 	
 	local LiFu = scene.GetNpcByNickName("LiFu")
 	local LiChengEn = scene.GetNpcByNickName("LiChengEn")
 	if LiFu then
 		LiFu.DelBuff(11034, 1)
 		LiFu.AddBuff(LiFu.dwID, LiFu.nLevel, 10935, 1)
 	end

 	if LiChengEn then
 		LiChengEn.DelBuff(11034, 1)
 		LiChengEn.AddBuff(LiChengEn.dwID, LiChengEn.nLevel, 10935, 1)
 	end
 end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com