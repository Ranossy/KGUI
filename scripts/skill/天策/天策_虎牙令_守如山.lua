---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/���/���_������_����ɽ.lua
-- ����ʱ��:	2013/6/3 19:53:54
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_������-����ɽ.lua
-- ������    :  ����	
-- ����ʱ��  :  2008-03-04 
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ������
-- ��������  :  ����ɽ
-- ����Ч��  :  ��Ѫս����,����һ��Ŀ��,����15��,��������,�����˺�����80%,����15��.6����������,��Ѫ600��.
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nCostMana = 31, nBuffID = 367}, -- Level 1
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)
	
	local dwSkillLevel = skill.dwLevel;
	
	--skill.BindBuff(1, 367, 1)
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/���/���_������_����ɽ.lua", -- ����ֵ1
		0														-- ����ֵ2
	);
----��Ӱ�Ѫս���µ�����ɽʩ��
--	skill.AddAttribute(
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
--		416,
--		1
--	);
--����������µ�����ɽʩ��
--[[	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CAST_SKILL_TARGET_DST,
		419,
		1
	);	--]]

	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetPublicCoolDown(16);		--����CD1��
	skill.SetNormalCoolDown(1, 149);
	skill.SetCheckCoolDown(1, 444)	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 61;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = MELEE_ATTACK_DISTANCE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
    
    
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��
    
	skill.nBulletVelocity = 0;										--�ӵ��ٶ�,��/֡
    
	skill.nBreakRate = 1024;									--����ϵĸ���,Ĭ��1024��ʾһ�������
   
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
end
function Apply(dwCharacterID)
	local player = GetPlayer(dwCharacterID)
	if player.GetSkillLevel(5664) == 1 then
		player.nCurrentLife = player.nCurrentLife + player.nMaxLife * 0.1
	end
	--ǿ�ƹ���
	if player.GetSkillLevel(6518) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6129, 1, 3)
	end


	local nTime = 0
	if player.GetSkillLevel(14804) == 1 then
		nTime = 9 - math.floor(player.nCurrentLife / player.nMaxLife * 10, 1)
		nTime = math.max(nTime, 0)
	end
	
	if player.GetSkillLevel(5694) ~= 1 then
		if not player.IsSkillRecipeActive(389, 1) then
			player.AddBuff(dwCharacterID, player.nLevel, 367, 1, 8 + nTime)		--�����
		else
			player.AddBuff(dwCharacterID, player.nLevel, 367, 1, 11 + nTime)
		end
	else
		if not player.IsSkillRecipeActive(389, 1) then
			--player.AddBuff(dwCharacterID, player.nLevel, 367, 1, 8)
			player.AddBuff(dwCharacterID, player.nLevel, 6163, 1, 8 + nTime)
		else
			--player.AddBuff(dwCharacterID, player.nLevel, 367, 1, 11)
			player.AddBuff(dwCharacterID, player.nLevel, 6163, 1, 11 + nTime)
		end
		--player.AddBuff(dwCharacterID, player.nLevel, 6163, 1, 20)
		--player.AddBuff(dwCharacterID, player.nLevel, 6163, 1, 23)
	end
	ModityCDToUI(player, 413, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com