---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/������/SkillLearn.lua
-- ����ʱ��:	01/04/10 16:05:21
-- �����û�:	zhengkaifeng
-- �ű�˵��:	���ȼ����ã�ƺ��䣻�����֣���ϡ�Ƶ��ꡣ���ǧ��������̣�����Ը��һ�Ի��˼䡣
----------------------------------------------------------------------<

Include("scripts/Include/Player.lh")
Include("scripts/skill/include/SkillLearn.lh")
Include("scripts/skill/include/strings.ls")

function OnUse(player, item)
	player.SendSystemMessage(GetEditorString(5, 6819))
	-- local nPlayerLevel = player.nLevel
	-- local SkillLearnInfo = SkillLearnTable[item.dwIndex]
	-- local nFormID = 0
	-- local nSkillID = 0
	-- local LearnSkillLevel = 0
	-- local nSkillLevel = 0
	-- local nKungfulevel = 0
	-- local skill = nil
	-- 
	-- if not SkillLearnInfo then
	-- 	return false, false
	-- end
	-- 
	-- nFormID         = SkillLearnInfo.NeedFormID  -- �ڹ�����ʽ��·ID
	-- nKungfulevel    = player.GetSkillLevel(nFormID)  -- �ڹ�����ʽ��·����
	-- nSkillID        = SkillLearnInfo.SkillID  -- �ڹ��ķ�����ʽѧϰ���Ŷ�ӦID
	-- LearnSkillLevel = SkillLearnInfo.SkillLevel  -- �ڹ��ķ�����ʽѧϰ����ѧϰ����
	-- nSkillLevel     = player.GetSkillLevel(nSkillID)  -- ������ϼ�������
	-- 
	-- if nPlayerLevel < 70 and LearnSkillLevel ~= 0 then  -- ��ҵȼ�С��70��ʱ�Ķ������飬�޷�ʹ��
	-- 	player.SendSystemMessage("��Ľ���������ǳ���޷��������ʽ��")
	-- 	return false, false
	-- end
	-- 
	-- if LearnSkillLevel ~= 0 then  -- ��ҵȼ�����70��ʱ�Ķ�������
	-- 	if nSkillLevel >= LearnSkillLevel then  -- �����ѧ��ü��ܣ������������ڵ��ڼ���������
	-- 		player.SendSystemMessage("�����������ʽ�������ٴ�ѧϰ��")
	-- 		return false, false
	-- 	end
	-- 	
	-- 	if nSkillLevel ~= LearnSkillLevel - 1 then  -- ����ڹ��ķ�ѧϰ��ʹ�������ѧϰ����ԣ�����������������ڼ����鳬��һ��
	-- 		player.SendSystemMessage(string.format("�޷�����%s����Ҫ������ǰһ�ء�", SkillLearnInfo.SkillName))
	-- 		return false, false
	-- 	end
	-- 	
	-- else  -- ���ʹ�õ�������������
	-- 	if nSkillLevel == 0 then  -- ���δѧ������������Ŷ�Ӧ����ʽ
	-- 		player.SendSystemMessage(string.format("����Ҫ��ѧ��%s��", SkillLearnInfo.SkillName))
	-- 		return false, false
	-- 	end
	-- 	
	-- 	skill = GetSkill(nSkillID, nSkillLevel)
	-- 	if not skill then
	-- 		return false, false
	-- 	end
	-- 	
	-- 	if nSkillLevel == skill.dwMaxLevel then  -- ���ѧ���˸���ʽ�������
	-- 		player.SendSystemMessage("�����������ʽ����أ����������������ȡ�")
	-- 		return  false, false
	-- 	end
	-- end
	-- 
	-- if nKungfulevel == 0 then  -- ���δѧ������Ŷ�Ӧ��ʽ������·
	-- 	player.SendSystemMessage(string.format("�޷��������ʽ����Ҫ��ѧ��%s��·��", SkillLearnInfo.FormName))
	-- 	return false, false
	-- end
	-- 
	-- if LearnSkillLevel ~= 0 then  -- ���ʹ�õ�����ʽѧϰ���ţ��������п�ѧϰ����������
	-- 	player.SendSystemMessage(string.format("���ѳɹ�����%s��", SkillLearnInfo.SkillName))
	-- 	player.LearnSkill(SkillLearnInfo.SkillID)
	-- 	return false, true	
	-- 	
	-- else  -- ���ʹ�õ��Ǽ������������ţ��������п�ʹ������������
	-- 	player.SendSystemMessage(string.format("���%s����%s�������ȡ�", SkillLearnInfo.SkillName, SkillLearnInfo.AddSkillExp))
	-- 	player.AddSkillExp(SkillLearnInfo.SkillID, SkillLearnInfo.AddSkillExp)
	-- 	return false, true
	-- end
	
	return false, false
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com