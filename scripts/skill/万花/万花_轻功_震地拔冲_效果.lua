---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/��/��_�Ṧ_��ذγ�_Ч��.lua
-- ����ʱ��:	2013/4/24 10:32:53
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ��_�Ṧ_��ذγ�_Ч��.lua
-- ������    :  ����
-- ����ʱ��  :  2008-3-7
-- ��;(ģ��):  �书����
-- �书����  :  ��
-- �书����  :  �⹦
-- �书��·  :  ���Ṧ
-- ��������  :  ��ذγ�
-- ����Ч��  :  ���Լ��ĺ󷽿����ƶ�������ʱ����ɷ�Χ�˺�,����������Ծ�е�Ŀ��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nNeutralDamage = 10, nNeutralDamageRand = 4},
	{nNeutralDamage = 12, nNeutralDamageRand = 4},
	{nNeutralDamage = 14, nNeutralDamageRand = 4},
	{nNeutralDamage = 16, nNeutralDamageRand = 4},
	{nNeutralDamage = 18, nNeutralDamageRand = 4},
	{nNeutralDamage = 20, nNeutralDamageRand = 4}
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,
		tSkillData[dwSkillLevel].nNeutralDamage,
		0
	);
    
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nNeutralDamageRand,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_NEUTRAL_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/��/��_�Ṧ_��ذγ�_Ч��.lua",
		0
	);	
--    if dwSkillLevel >= 5 then
--    	skill.BindBuff(1, 998, 1)--ѣ��Ч��
--    end								--2009.6.29ȥ������Ч��
	
	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 8);
	
	----------------- ����������� ----------------------------------------  

	--�����뾶��Ҳ���ǹ�������Ч����
	--skill.nMaxRadius        = 4 * LENGTH_BASE;
	skill.nAngleRange = 256; 
	skill.nAreaRadius = 8 * LENGTH_BASE;
	skill.nTargetCountLimit = 25;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
	--����֡��
	skill.nPrepareFrames = 0;
	--�ӵ��ٶ�
	skill.nBulletVelocity = 0;
	--����ϵĸ���
	skill.nDismountingRate = PERCENT_BASE;					-- ��Ŀ�����������,����1024��Ĭ��0	2008��6��27��CBG						
  
	skill.nBreakRate = 0;
   
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
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	local target
	if IsPlayer(dwCharacterID) then
		target = GetPlayer(dwCharacterID)
	else
		target = GetNpc(dwCharacterID)
	end
	if not target then
		return
	end
	--[[
	if player.GetSkillLevel(5763) == 1 then
		target.AddBuff(dwSkillSrcID, player.nLevel, 5694, 1, 1)
	end
	--]]
	target.AddBuff(dwSkillSrcID, player.nLevel, 5694, 1, 1)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com