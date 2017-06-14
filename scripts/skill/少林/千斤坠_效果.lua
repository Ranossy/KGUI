---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/ǧ��׹_Ч��.lua
-- ����ʱ��:	2013/9/11 9:50:56
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ǧ��׹_�ͷ�.lua
-- ������    :  ����
-- ����ʱ��  :  2008-1-29
-- ��;(ģ��):  �书����
-- �书����  :  ����
-- �书����  :  �⹦
-- �书��·  :  ��������
-- ��������  :  ǧ��׺_�ͷ�
-- ����Ч��  :  �ͷ�ǧ��׺BUFF
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nSolarDamage = 16, nSolarDamageRand = 3},
	{nSolarDamage = 17, nSolarDamageRand = 3},
	{nSolarDamage = 21, nSolarDamageRand = 3},
	{nSolarDamage = 23, nSolarDamageRand = 3},
	{nSolarDamage = 26, nSolarDamageRand = 3},
	{nSolarDamage = 28, nSolarDamageRand = 3}
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;
	if dwSkillLevel >= 5 then
		skill.BindBuff(1, 464, 1)--ѣ��Ч��
	end
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE,
		tSkillData[dwSkillLevel].nSolarDamage,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_SOLAR_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nSolarDamageRand,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_SOLAR_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK, -- ��������ģʽ
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT, -- ħ������
		"skill/����/ǧ��׹_Ч��.lua", -- ����ֵ1
		0														-- ����ֵ2
	);

	--skill.AddSlowCheckSelfBuff(562, 0, BUFF_COMPARE_FLAG.EQUAL);		-- ��������Buff
    
	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	skill.SetNormalCoolDown(1, 193);
	
	----------------- ����������� ----------------------------------------  
    
	--�����뾶��Ҳ���ǹ�������Ч����		
	skill.nAreaRadius = 8 * LENGTH_BASE;
	skill.nAngleRange = 256; 
	skill.nTargetCountLimit = 10;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
	--����֡��
	skill.nPrepareFrames = 0;
	--�ӵ��ٶ�
	skill.nBulletVelocity = 0;
	--����ϵĸ���
	skill.nDismountingRate = 1024;									--������Ϊ100%
	skill.nBreakRate = 1000;
   
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
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwCharacterID)
	local nSkill = player.GetKungfuMount()
	if not player then
		return
	end
	if player.GetSkillLevel(5895) == 1 then
		player.CastSkill(1018, 1)
	end

	--�׾��ķ���ǧ��׹���ض�
	if nSkill ~= nil and nSkill.dwSkillID == 10003 then
		player.CastSkill(1018, 1)
	end
	
	if player.GetSkillLevel(5935) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6210, 1, 1)
	end
	if player.GetSkillLevel(5936) == 1 then
		player.AddBuff(dwCharacterID, player.nLevel, 6211, 1, 1)
	end
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com