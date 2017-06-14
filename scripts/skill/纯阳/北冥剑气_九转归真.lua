---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/��ڤ����_��ת����.lua
-- ����ʱ��:	2013/6/28 16:14:38
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- ������    :  ����	
-- ����ʱ��  :  2007-12-11
-- ����Ч��  :  �����ڽ����ý�����Ŀ����ɡ�
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{ nDamageBase = 50 * 0.95, nDamageRand = 50 * 0.1, nTime = 18, nCostMana = 379}, --level 1
	{ nDamageBase = 58 * 0.95, nDamageRand = 58 * 0.1, nTime = 18, nCostMana = 478}, --level 2
	{ nDamageBase = 66 * 0.95, nDamageRand = 66 * 0.1, nTime = 18, nCostMana = 544}, --level 3
};


--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = 3
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_NEUTRAL_DAMAGE,
		tSkillData[dwSkillLevel].nDamageBase,
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
		ATTRIBUTE_TYPE.CALL_REPULSED,
		tSkillData[dwSkillLevel].nTime, --����ʱ��(֡)
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/��ڤ����_��ת����.lua", -- ��Э��
		0
	);
	--skill.BindBuff(1, 452, 1);
	
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetPublicCoolDown(16);	--����CD
	skill.SetNormalCoolDown(1, 80);	--CD20s
	--skill.SetNormalCoolDown(2, 625);	--CD20s
	skill.SetCheckCoolDown(1, 444)
	--skill.SetCheckCoolDown(2, 625)
	--������λ
	--skill.nAttackWeakPos = SKILL_ATTACK_WEAK_POS.UPPER
	
	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana			= tSkillData[dwSkillLevel].nCostMana;
	skill.nCostManaBasePercent = 182;	-- �������ĵ�����
	----------------- ����������� ----------------------------------------------------------------------
   
	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 0										--����ʩ����С�뾶
	skill.nMaxRadius = 8 * LENGTH_BASE;						--����ʩ�����뾶
	skill.nAngleRange = 85; 									--ʩ�ŽǶ�120��
    
	skill.nPrepareFrames = 0;									--����֡��,16֡����1��
    
	--skill.nBulletVelocity = 30;									--�ӵ��ٶ�,��/֡
 	
	skill.nDismountingRate = 1024;									--������Ϊ100%
 	
	skill.nDismountingRate = 1024;									--������Ϊ100%
    
	skill.nBreakRate = 1024;									--��ϵĸ���,Ĭ��1024��ʾһ�����
    
	return true;
end



--�Լ���ִ�е�����������飬�ú��������ڿ�ʼʩ�ż��ܵ�ʱ�򱻵��ã���ȷ���Ƿ����ʩ�Ÿû���
--Player: ����ʩ����
--nPreResult: �������水��һ�������жϵĽ����ע�⣬�����Խű����صĽ��Ϊ׼
function CanCast(player, nPreResult)    
--�ж���ҵ�״̬�����ж��Ƿ���Է�������
	return nPreResult;
end

function OnSkillLevelUp(skill, player)
end
function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
	if not player then
		return
	end
	
	local target = player.GetSelectCharacter()
	if player.GetSkillLevel(6772) == 1 and target then
		target.AddBuff(dwSkillSrcID, player.nLevel, 6311, 1, 1)
	end

	ModityCDToUI(player, 305, 0, 0)
end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com