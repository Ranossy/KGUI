---------------------------------------------------------------------->
-- �ű�����:	scripts/skill/����/���г��.lua
-- ����ʱ��:	2015/8/18 15:37:07
-- �����û�:	linjiajia2
-- �ű�˵��:
----------------------------------------------------------------------<

--------------�ű��ļ���ʼ------------------------------------------------------------------------------

Include("scripts/Include/Skill.lh")
Include("scripts/Include/Player.lh")

tSkillData =
{
	{nDamage = 34, nCostMana = 63, nDashSpeed = 120}, -- Level 1 Dash�ٶȵ�λ ��/֡

};

--�����书���ܼ��������ֵ
function GetSkillLevelData(skill)

	local bRetCode = false;
	local dwSkillLevel = skill.dwLevel;

--	skill.AddAttribute(										--ͻ�������Ч��  2010.11.16 CBG
--		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_SELF_NOT_ROLLBACK,
--		ATTRIBUTE_TYPE.DEL_MULTI_GROUP_BUFF_BY_FUNCTIONTYPE,
--		7,
--		9999
--	);

	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.DASH,
		tSkillData[dwSkillLevel].nDashSpeed,
		0
	);
	
	skill.AddAttribute(
		ATTRIBUTE_EFFECT_MODE.EFFECT_TO_DEST_NOT_ROLLBACK,
		ATTRIBUTE_TYPE.EXECUTE_SCRIPT,
		"skill/����/���г��.lua",
		0
	);


	----------------- ����CoolDown ---------------------------------------------------------------------
	--SetPublicCoolDown(id)���ù���CD��SetNormalCoolDown(posi, id)���ü���CD������posiΪCoolDownλ(��3λ)��id��Ҫ��CoolDownList.tab
--	skill.SetPublicCoolDown(16);		--����CD1��
	--skill.SetNormalCoolDown(1, 98);

	----------------- ���ü������� ---------------------------------------------------------------------
	--skill.nCostMana	= tSkillData[dwSkillLevel].nCostMana;

	----------------- ����������� ----------------------------------------------------------------------

	--skill.dwLevelUpExp      	= tSkillData[dwSkillLevel].nLevelUpExp;	--��������
	--skill.dwBaseKungfuExpAdd 	= 10;

	skill.nMinRadius = 1 * LENGTH_BASE;					--����ʩ����С�뾶
	skill.nMaxRadius = 30 * LENGTH_BASE;							--����ʩ�����뾶
	skill.nAngleRange = 128; 										--ʩ�ŽǶ�,ȫ��256
	skill.nWeaponDamagePercent = 0;
	skill.nPrepareFrames = 0;										--����֡��,16֡����1��

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

end

function Apply(dwCharacterID, dwSkillSrcID)
	local player = GetPlayer(dwSkillSrcID)
--	print("Apply*******************", dwCharacterID, player, dwSkillSrcID)
	player.AddBuff(0, 99, 9677, 3)
	local buff = player.GetBuff(9677, 3)
--	print("buff", buff)
	if not buff then
		return
	end
	buff.nCustomValue = dwCharacterID
--	player.SetTimer(2, "scripts/skill/����/���г��.lua", 0, 0)
end

function UnApply(dwCharacterID)
end


function OnTimer(player, nParam1, nParam2)
	if not player then
		return
	end
--	player.AddBuff(0, 99, 9518, 3)
end

 -- by ÿ����ͣ@�ν��� $ Jx3UnPack-PAKV3 jx3.mail@gmail.com