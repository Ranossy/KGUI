---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/npc/����BOSS/̫ԭ֮ս_ҹ�ع³�/�����ݳ�_�ֶ�buff.lua
-- ����ʱ��:	2014/7/17 17:49:24
-- �����û�:	guozhaoxing1
-- �ű�˵��:
----------------------------------------------------------------------<

function Apply(dwCharacterID)
end

-- ��һ�����ܷ�Ӧ�õ�ʱ�򴥷�(��BUFF��ʧ), ����Ϊ���õĶ���ID
function UnApply(dwCharacterID)
	--print("�ֶ�UnApply")
	local playerA = GetPlayer(dwCharacterID)
	if playerA and playerA.nMoveState ~= MOVE_STATE.ON_DEATH then
		playerA.DoAction(0, 13243)
	end
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com