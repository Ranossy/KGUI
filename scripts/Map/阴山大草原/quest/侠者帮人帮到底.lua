---------------------------------------------------------------------->
-- �ű�����:	scripts/Map/��ɽ���ԭ/quest/���߰��˰ﵽ��.lua
-- ����ʱ��:	2015/9/3 17:39:04
-- �����û�:	zhangtianhui1
-- �ű�˵��:
----------------------------------------------------------------------<
--function OnInit(QuestInfo)
	--QuestInfo.SetMaxStageGoalCount(1)
	--QuestInfo.SetNeedItemByStage(0, 0, 5, 23905, 6)
--end

function OnAcceptQuest(player, dwQuestTemplateID)
end

-- �����ʵ�ʽ��������ʱ�򴥷�(������, ��������Ŀ����)
function OnFinishQuest(player, nPresentChoice1, nPresentChoice2, dwQuestTemplateID)
	local nAmount1 = player.GetItemAmountInAllPackages(5, 23905)
	if nAmount1 >= 1 then
		player.CostItemInAllPackage(5, 23905, nAmount1)
	end
	local nAmount2 = player.GetItemAmountInAllPackages(5, 23906)
	if nAmount2 >= 1 then
		player.CostItemInAllPackage(5, 23906, nAmount2)
	end
end

-- �����ʵ��ɾ�������ʱ�򴥷�
function OnCancelQuest(player, dwQuestTemplateID)
	local nAmount1 = player.GetItemAmountInAllPackages(5, 23905)
	if nAmount1 >= 1 then
		player.CostItemInAllPackage(5, 23905, nAmount1)
	end
	local nAmount2 = player.GetItemAmountInAllPackages(5, 23906)
	if nAmount2 >= 1 then
		player.CostItemInAllPackage(5, 23906, nAmount2)
	end
end

-- QUEST�ű�, �Ŷ�����ʼ��ʱ�򴥷�, ͬһ���Ŷ�������һ������ֻ��ͬʱ��һ����ҽ�
-- �����κ��˽����Ŷ������, ����10��ʱ��ѯ�����ж�������Ƿ�Ҳһ�����, ʱ��������ô˺���
--function OnStartQuest(scene, npc)
--end;


 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com