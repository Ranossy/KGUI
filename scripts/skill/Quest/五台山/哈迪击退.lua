---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/Quest/��̨ɽ/���ϻ���.lua
-- ����ʱ��:	2015/7/21 19:53:30
-- �����û�:	zhangchennan
-- �ű�˵��:
----------------------------------------------------------------------<
------------------------------------------------
-- �ļ���    :  Ⱥץ�Ӽ���_Ⱥ�����.lua
-- ������    :  zhx
-- ����ʱ��  :  20110412
-- ��;(ģ��):  Ѫ������
-- �书����  :
-- �书����  :
-- �书��·  :
-- ��������  :  ����
-- ����Ч��  :  Ⱥ���˺�+����+DEBUFF
------------------------------------------------

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

--���ӳ���ݶ��ͼ����˺����
tSkillData =
{
	{nDamageBase = 11800 * 0.8, nDamageRand = 11800 * 0.4, nCostMana = 0}, --level 1

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local dwSkillLevel = skill.dwLevel;

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.CALL_REPULSED,
		22, --�ٶ�
		0
	);

	--skill.BindBuff(1, 2748, 1);
	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--����CD1��
--	skill.SetNormalCoolDown(2, 93);

	----------------- ���ü������� ---------------------------------------------------------------------
	skill.nCostMana = 0;

	----------------- ʱ����� -------------------------------------------------
	--skill.nPrepareFrames  	= 0;				-- ����֡��
	--skill.nChannelInterval	= 15; 				-- ͨ�������ʱ��
	--skill.nChannelFrame		= 48;	 			-- ͨ��������ʱ�䣬��λ֡��
	--skill.nBulletVelocity		= 0;				-- �ӵ��ٶȣ���λ ��/֡

	----------------- ������ -------------------------------------------------
	--skill.nBrokenRate      = 0 * PERCENT_BASE;	-- ���ܱ���ϵĸ���.����1024
	--skill.nBreakRate		= 0;					-- ���Ŀ��ʩ���ĸ���,����1024

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nWeaponDamagePercent = 0;

	skill.nMinRadius = 0											--����ʩ����С�뾶
	skill.nMaxRadius = 50 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 256; 										--ʩ�ŽǶ�,ȫ��256
	skill.nAreaRadius = 50 * LENGTH_BASE;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

	--skill.nBulletVelocity = 30;										--�ӵ��ٶ�,��/֡
	skill.nDismountingRate = 1024;									--������Ϊ100%
	--skill.nBreakRate = 0;									--����ϵĸ���,Ĭ��1024��ʾһ�������
	--skill.nTargetCountLimit = 30;
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

end
 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com