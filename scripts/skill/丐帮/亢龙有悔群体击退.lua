---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/ؤ��/�����л�Ⱥ�����.lua
-- ����ʱ��:	2013/6/8 1:21:45
-- �����û�:	taoli
-- �ű�˵��:	
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  ���_�Ӽ���_��_�˺�ѣ��.lua
-- ������    :  ����
-- ����ʱ��  :  2008-3-7
-- ��;(ģ��):  �书����
-- �书����  :  ���
-- �书����  :  �⹦
-- �书��·  :  ����Ṧ
-- ��������  :  ����ͻ
-- ����Ч��  :  ��ǰ���һ�ξ��룬ͬʱ���н�·���ϵĵ�������˺�������ѣ��Ч��
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData = 
{
	{nDamage = 55 * 0.95, nDamageRand = 55 * 0.1 },
	{nDamage = 90 * 0.95, nDamageRand = 90 * 0.1 },
	{nDamage = 125 * 0.95, nDamageRand = 125 * 0.1 },
	{nDamage = 160 * 0.95, nDamageRand = 160 * 0.1 },
	{nDamage = 195 * 0.95, nDamageRand = 195 * 0.1 },
	{nDamage = 230 * 0.95, nDamageRand = 230 * 0.1 },
	{nDamage = 278 * 0.95, nDamageRand = 278 * 0.1 },
	{nDamage = 326 * 0.95, nDamageRand = 326 * 0.1 },
	{nDamage = 419 * 0.95, nDamageRand = 419 * 0.1 },
	{nDamage = 595 * 0.95, nDamageRand = 595 * 0.1 },
	{nDamage = 630 * 0.95, nDamageRand = 630 * 0.1 },
	{nDamage = 778 * 0.95, nDamageRand = 778 * 0.1 },
	{nDamage = 826 * 0.95, nDamageRand = 826 * 0.1 },
	{nDamage = 959 * 0.95, nDamageRand = 959 * 0.1 },	
};
--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;
	local bRetCode = false;
				
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE,
		tSkillData[dwSkillLevel].nDamage,
		0
	);
		
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_AND_ROLLBACK,
		ATTRIBUTE_TYPE.SKILL_PHYSICS_DAMAGE_RAND,
		tSkillData[dwSkillLevel].nDamageRand,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_PHYSICS_DAMAGE,
		0,
		0
	);
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_REPULSED,
		12, --�ٶ�
		0
	);
	skill.AddSlowCheckSelfBuff(6381, dwSkillLevel-1, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ��������Buff
	skill.AddSlowCheckDestBuff(6393, 0, BUFF_COMPARE_FLAG.EQUAL, 0, BUFF_COMPARE_FLAG.GREATER_EQUAL);		-- ����Ŀ��Buff
	----------------- ����Cool down ---------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
	--skill.SetNormalCoolDown(1, 8);
	
	----------------- ����������� ----------------------------------------
	skill.bIgnorePrepareState = true
	skill.nMinRadius = 0 * LENGTH_BASE;		-- ����ʩ�ŵ���С���� 
	skill.nMaxRadius = 8 * LENGTH_BASE;		-- ����ʩ�ŵ������� 

	----------------- ���÷�Χ -------------------------------------------------
	--skill.nProtectRadius = 0 * LENGTH_BASE;                     -- ���κ;���AOE�ı������룬��Χ�ڲ����˺�
	skill.nHeight = 10 * LENGTH_BASE;                            -- AOE�ĸ߶ȣ�ȫ�ߣ�Բ����AOE�в���Ϊ2����nAreaRadius������AOE�в���ΪnAreaRadius
	skill.nRectWidth = 10 * LENGTH_BASE;                         -- ����AOE�Ŀ�ȣ�ȫ������ΪnAreaRadius
	skill.nAngleRange = 256;					-- ������Χ�����νǶȷ�Χ
	skill.nAreaRadius = 10 * LENGTH_BASE;		-- �������ð뾶 
	skill.nTargetCountLimit = 5;				-- ��������Ŀ����������,(С��0 ����Ŀ������������) 
	--�����뾶��Ҳ���ǹ�������Ч����

	--����֡��
	--skill.nPrepareFrames = 0;
	skill.nChannelInterval = (125 + (dwSkillLevel-1) * 20)*1.35*1.1;     -- ͨ�������ʱ��
	--�ӵ��ٶ�
	--skill.nBulletVelocity = 0;
	--����ϵĸ���
	skill.nBreakRate = 0;
	skill.nLeastFormationPopulation = 5;
	--skill.nWeaponDamagePercent = 0;
	skill.nWeaponDamagePercent = 0; -- �����˺��ٷֱ�,���⹦�˺����á���0��ʾ�˴��⹦���������������˺�,1024Ϊ100%
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
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com