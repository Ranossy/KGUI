---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/�츳/NewTalent.lua
-- ����ʱ��:	2017/3/29 17:46:19
-- �����û�:	XIAXIANBO1
-- �ű�˵��:
----------------------------------------------------------------------<
-----------------------------------------------
-- �ļ���    :  Talent.lua
-- ������    :  Wangtao
-- ����ʱ��  :  2013-04-26
-- ��;(ģ��):  ���츳ϵͳ
-- ��;  	 :  Server�����츳����
------------------------------------------------

function DoSelectPoint(player, dwPoint, nSelectIndex)
	--player.SelectNewTalentPoint(dwPoint, nSelectIndex)
	if not player.GetBuff(11840, 1) then
		player.CastSkillXYZ(6191, 1, dwPoint, nSelectIndex, 0)
		player.PlaySfx(512, player.nX, player.nY, player.nZ)
		player.AddBuff(0, 99, 6004, 1, 1)
	else
		player.SendSystemMessage(GetEditorString(11, 4757))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(11, 4685), 4)
	end
end

function DoChangeSet(player, nNewSetIndex)
	if not player.GetBuff(11840, 1) then
		player.AddBuff(0, 99, 6004, 1, 5)
		if player.GetBuff(6004, 1) then
			local nbuff = player.GetBuff(6004, 1)
			nbuff.nCustomValue = nNewSetIndex
		end
		player.CastSkill(9092, 1)
		player.PlaySfx(512, player.nX, player.nY, player.nZ)
	else
		player.SendSystemMessage(GetEditorString(11, 4758))
		RemoteCallToClient(player.dwID, "OnOutputWarningMessage", "MSG_NOTICE_RED", GetEditorString(11, 4741), 4)
	end
	--player.ChangeNewTalentSet(nNewSetIndex)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com