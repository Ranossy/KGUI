---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_����ǹ��_�Ʒ�.lua
-- ����ʱ��:	2017/5/11 14:32:06
-- �����û�:	chenchen6-pc
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_����ǹ��_�Ʒ�.lua
-- ������    :  ����
-- ����ʱ��  :  2008-02-26 16:14
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����ǹ��
-- ��������  :  �Ʒ�
-- ����Ч��  :  ����Ŀ��һ����ѪЧ����
--��������״̬��,�ü��ܴ����Ƽ�Ч��,������������ޡ�

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData =
{
	{nCostMana = 14, nDotID = 661, nDotLevel = 1, nThreat = 265   }, -- Level 1
	{nCostMana = 22, nDotID = 661, nDotLevel = 2, nThreat = 325   }, -- Level 2
	{nCostMana = 29, nDotID = 661, nDotLevel = 3, nThreat = 385   }, -- Level 3
	{nCostMana = 40, nDotID = 661, nDotLevel = 4, nThreat = 445   }, -- Level 4
	{nCostMana = 49, nDotID = 661, nDotLevel = 5, nThreat = 505   }, -- Level 5
	{nCostMana = 57, nDotID = 661, nDotLevel = 6, nThreat = 565   }, -- Level 6
	{nCostMana = 65, nDotID = 661, nDotLevel = 7, nThreat = 625  }, -- Level 7
	{nCostMana = 73, nDotID = 661, nDotLevel = 8, nThreat = 685  }, -- Level 8
	{nCostMana = 81, nDotID = 661, nDotLevel = 9, nThreat = 745  }, -- Level 9
	{nCostMana = 90, nDotID = 661, nDotLevel = 10, nThreat = 805  }, -- Level 10
	{nCostMana = 90, nDotID = 661, nDotLevel = 11, nThreat = 865  }, -- Level 11
	{nCostMana = 90, nDotID = 661, nDotLevel = 12, nThreat = 925   }, -- Level 12
	{nCostMana = 90, nDotID = 661, nDotLevel = 13, nThreat = 985   }, -- Level 13
	{nCostMana = 90, nDotID = 661, nDotLevel = 14, nThreat = 1045   }, -- Level 14
	{nCostMana = 90, nDotID = 661, nDotLevel = 15, nThreat = 1105   }, -- Level 15
	{nCostMana = 90, nDotID = 661, nDotLevel = 16, nThreat = 1165   }, -- Level 16
	{nCostMana = 90, nDotID = 661, nDotLevel = 17, nThreat = 1225   }, -- Level 17
	{nCostMana = 90, nDotID = 661, nDotLevel = 18, nThreat = 1285  }, -- Level 18
	{nCostMana = 90, nDotID = 661, nDotLevel = 19, nThreat = 1345  }, -- Level 19
	{nCostMana = 90, nDotID = 661, nDotLevel = 20, nThreat = 1405  }, -- Level 20
	{nCostMana = 90, nDotID = 661, nDotLevel = 21, nThreat = 1465  }, -- Level 21
	{nCostMana = 90, nDotID = 661, nDotLevel = 22, nThreat = 1525  }, -- Level 22
	{nCostMana = 90, nDotID = 661, nDotLevel = 23, nThreat = 1585  }, -- Level 23
	{nCostMana = 90, nDotID = 661, nDotLevel = 24, nThreat = 1645  }, -- Level 24
	{nCostMana = 90, nDotID = 661, nDotLevel = 25, nThreat = 1705  }, -- Level 25
};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

	skill.BindBuff(1, 3442, dwSkillLevel)  --��Ѫ
	--skill.BindBuff(2, 661, dwSkillLevel)  --����

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_�����¼�_�����к�ˢ���Ʒ��DOT3Ŀ��.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/90����Ѩ/��ħ_�Ʒ��Ƽ�Ч��.lua", -- ����ֵ1
		0														-- ����ֵ2
	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/90����Ѩ/��ħ_�Ʒ總������CD���Ӽ���.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 92);
	skill.SetCheckCoolDown(1, 444)

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	if dwSkillLevel <= 5 then
		skill.nCostManaBasePercent = 167 * 0.2;	-- �������ĵ�����
	elseif dwSkillLevel <= 10 then
		skill.nCostManaBasePercent = 167 * 0.4;
	elseif dwSkillLevel <= 15 then
		skill.nCostManaBasePercent = 167 * 0.6;
	elseif dwSkillLevel <= 20 then
		skill.nCostManaBasePercent = 167 * 0.8;
	else
		skill.nCostManaBasePercent = 167;
	end
	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;
	skill.nWeaponDamagePercent = 0;
	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256

	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
	if dwSkillLevel < 10 then
		skill.nChannelInterval = 100;
	elseif dwSkillLevel < 25 then
		skill.nChannelInterval = 100 + (dwSkillLevel - 9) * 10
	else
		skill.nChannelInterval = 346;     -- ͨ�������ʱ��
	end
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡

	skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������

	return true;
end

--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function CanLearnSkill(skill, player)
	return true
end

function OnSkillLevelUp(skill, player)
	if skill.dwLevel == skill.dwMaxLevel then
		player.AcquireAchievement(39)
	end
	-- if player.IsAchievementAcquired(36) and player.IsAchievementAcquired(37) and player.IsAchievementAcquired(38) and player.IsAchievementAcquired(39) and player.IsAchievementAcquired(40) and player.IsAchievementAcquired(41) then
	-- player.AcquireAchievement(68)
	-- end
end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end

	local target
	if IsPlayer(dwCharacterID) then
		return
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	local sLevel = player.GetSkillLevel(401)
	local kID = player.GetKungfuMount().dwSkillID
	if kID ~= nil then
		if kID == 10062 then
		end
	end
	--target.ModifyThreat(dwSkillSrcID, 30 * sLevel)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com