---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/item/ؤ����������_AOE�ӳ�BUFF.lua
-- ����ʱ��:	2016/10/10 21:40:17
-- �����û�:	ZHANGGUANYI
-- �ű�˵��:
----------------------------------------------------------------------<
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player and player.nMoveState ~= MOVE_STATE.ON_DEATH then
		--	player.DoAction(0,15151)
		--player.AddBuff(player.dwID, player.nLevel, 11392, 1)
		--player.CastSkill(17028, 1)
		if player.GetBuff(11422, 1) then
			local nCount = player.GetBuff(11422, 1).nStackNum
			--print(nCount)
			player.CastSkill(17039, nCount)
		end

	end
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com